
In  this note I'm gonna talking about a Port Forwarding technique, this technique allows us to make a privilege escalation using open ports that are running only in local network ,thus we could bypass firewalls and a blocked connections. That means it can be useful to use a an network you are not into if you have access to a machine that are into this network.  This is technique, you should take a read in these two notes before reaching that one. ~
[Basic concepts](Network/Basic%20concepts.md)
[Networks Introduction](Network/Networks%20Introduction.md)
I'm using this blog as source so you should take a look at them as well.
 [juggernaut/port-forwarding](https://juggernaut-sec.com/port-forwarding-lpe/);
[infosec-writeup](https://infosecwriteups.com/gain-access-to-an-internal-machine-using-port-forwarding-penetration-testing-518c0b6a4a0e);
[medium-port-forwarding](https://medium.datadriveninvestor.com/port-forwarding-for-beginners-11355d000867);

An concept that you need to know before going into this techniques are ports. Ports are using to addressing but it's used by an service running in your device and it's used to control which services are requesting or receiving something. Like, an device needs an IP to be recognized and found on a network and the services running into this device needs an “port” to be recognized too. And the combination of an ip address and an port enables communication by source/destination of a particular service on a particular device.

port forwarding is the process of redirecting a route from an ip:port to another ip:port. And how it can be useful? it can be used to access a port( can be called by service too ) that is only accessible internally on a particular device or even internally on particular network. 

think about this scenario, a company and you trying to HaCkiNg the company.

so now, we have

- you.
- public network.
- private network.
- bastion server.
- internal server.

you is this dude with hat(lmao) and you want to implant a malware inside internal server of the company and by obscure resources you’ve done the bastion server password and the internal server password. 

> bastion:skinnybear
> 
> 
> internal:supersecurepassword
> 

![Untitled](Network/attachments/Untitled.png)

so, let me explain this image. First the bastion, the bastion has  two network interfaces and with the one he can access the public network and communicate with another devices(like you) in this public network, and with the other he can communicate only with internal server.

so, internal server not can be access directly by you because he is in a private network and only bastion can communicate with him.

1. **172.17.0.1** is your ip.
2. **172.17.0.2** is bastion ip in **PUBLIC** network.
3. **10.10.10.2** is bastion ip in **PRIVATE** network.
4. **10.10.10.3** is the internal server ip.

so now, you did some scans in the bastion server and saw that one service called by “ssh” is open on port 2222.

 

![Untitled](Network/attachments/Untitled%201.png)

and you come to me and ask me an question: what the fuck does ssh means?

and i’ll explain to you, “ssh” or Secure Socket Shell is a secure communication protocol that allows send commands and remotely control a host over an encrypted connection. Think about it as one way to connect to another pc using terminal.

ok,you had the password of bastion,didn’t?

so, you can connect using 

```bash
$ ssh -p2222 bastion@172.17.0.2
```

so, translating it: we are saying to ssh connect to ipaddress 172.17.0.2 as bastion user at the port 2222.

and the password? Yeah you’ll insert it after press Enter and the ssh asked you.

 

![Untitled](Network/attachments/Untitled%202.png)

so now we are into bastion machine, look at these ips.

now is time to pivot hehehe

we’ll use the Dynamic Port Forwarding, this can be used to access an attacker’s service from a remote workstation thatt we can’t access directly and is it what we are doing. Our plan is open a port in our machine that tunnels the traffic to bastion server and bastion server redirect the request to internal server. For What? To enumerate the internal server, we can’t just install nmap in bastion server and run it, the forensics analysts are gonna kill us! And that’s why we’ll use the Dynamic Port Forwarding technique.

```
[localhost]:9050 <-> 2222:[bastion]:bport_any <-> iport_any:[internal_server]-------> request
<------- response
```

ok,so “localhost” is your pc(172.17.0.1). And this command below will open the port 9050 in your machine, every communication with this port will be rerouted to port 2222 of bastion server.

now, when the bastion receive the request,he will open a aleatory port to connect and communicate with the internal server!

and thus we can use nmap and enumerate the internal server, to see which services are running on it ;).

```bash
$ **ssh -D 9050 -p2222 -Nf bastion@172.17.0.2**
```

-D: do the dynamic port allocation.

-p: especify which port the ssh request will be made.

-N: don’t execute any command. 

-f: run in background.

![Untitled](Network/attachments/Untitled%203.png)

and now, as you can see in the terminal, the nmap scan found port 2222 in internal server. And in the output you can see the end-points of the scan. Starts in [localhost:9050](http://localhost:9050) goes through the chain(bastion) -<><>- and reaches the internal server 10.10.10.3.

i like to define the nmap scan in this way:

the nmap scan will “toc toc” in each port, the one that response the “toc toc” is an open port.

now we have to do Local port forwarding to log in the internal server and implat our malware.

> “When you want to expose a service in a server to a port of an interface reachable to you, use **Local port Forwarding**.”
> 

good quote! The internal service has a ssh open in 2222 too,but only bastion can communicate with the internal server, so in this case is when the local port forwarding will help us.

```bash
[localhost]-2323 <->2222-[bastion]-bport <->2222-[internal_server]-------> request
<------- response
```

and the command to expose the port 2222 of internal server to our machine is that:

```bash
$ ssh -L 2323:10.10.10.3:2222 -p2222 -Nf bastion@172.17.0.2
```

-L: is used to local port forward a request to remote server, so, i open the port 2323 in my [localhost](http://localhost) and everything request to this port will be reroute to 10.10.10.3:2222 through bastion server!

so now we can login in the internal server with:

```bash
$ ssh -p2323 admin@localhost
```

![https://miro.medium.com/v2/resize:fit:800/1*ZeoU7e1m8g2LLmpbkNTg4Q.png](https://miro.medium.com/v2/resize:fit:800/1*ZeoU7e1m8g2LLmpbkNTg4Q.png)

#