rooms from Tryhackme ~

- [what-is-networking](https://tryhackme.com/room/whatisnetworking)
- [intro-to-lan](https://tryhackme.com/room/introtolan)

This note is about content that I have learned doing some rooms on Tryhackme platform a some time ago. In this will have concepts about addressing(MAC and IPv4), Public and Private Networks. I recommend to you reading [Networks Introduction](Network/Networks%20Introduction.md) after that, that note has another useful concepts that relate with these topics here.

to do ~~
~ First you need to start talking about ipv4, CIDR, NAT an after that, Public and Private Network


The note you provided looks good overall! Here are some suggestions for improvement:

1. Clarify IP Assignment:

The statement "assigned to devices, routers, ISPs" can be simplified. IP addresses are primarily assigned to devices, not routers or ISPs directly. Routers have their own public IP assigned by the ISP, which they then use to manage devices on their network.
2. Refine Analogy:

The analogy comparing IPs to house addresses is a good start, but it can be improved. Instead of focusing on "street address, city address," etc., emphasize the hierarchical nature. You can say something like:
"An IP address acts like a location on the internet, similar to a home address. But unlike a house address with multiple levels (street, city, state), an IP identifies a device on a specific network."
3. Emphasize Public vs. Private:

You mentioned the change due to NAT, but it can be clarified further.
Briefly explain that most home networks use private IP addresses for internal communication, while the router has a single public IP for internet access. Devices on different private networks can have the same IP address.
4. Refine Gender Analogy:

The gender analogy might be a bit confusing. A simpler way to explain it is:
Imagine different neighborhoods (networks) with houses (devices) having the same address number. As long as they are in separate neighborhoods, they can have the same number.
Here's an example of how you could incorporate these suggestions:

An IP address is a unique identifier assigned to devices on a network. It's like your address on the internet, but unlike a home address with multiple levels (street, city, etc.), an IP pinpoints a device on a specific network.

There are two main types of IP addresses: public and private. Public IPs are unique identifiers for your network on the internet, assigned by your internet service provider (ISP). Private IPs are used for internal communication within your network,  like different houses in the same neighborhood having the same address number. Devices on different private networks can have the same IP address.

I hope this helps! Feel free to ask if you have any other questions.

That's a good thought, but the analogy between ISP and city isn't quite perfect. Here's why:

Networks: Neighborhoods are a good representation of individual networks. Each neighborhood (network) has its own set of addresses (private IPs) assigned to devices within it.
ISP: The ISP is more like the company that provides the infrastructure for the entire area, including all the neighborhoods (networks). They manage the overall addressing scheme and provide the public IP address that identifies your entire network (neighborhood) to the internet.
Here's an improved analogy:

Networks: Imagine a large city with many neighborhoods. Each neighborhood represents a separate network.
Devices: Houses within each neighborhood represent individual devices on the network. They have unique addresses (private IPs) within their neighborhood.
ISP: The city itself is like the ISP. They maintain the infrastructure (roads, cables) that allows neighborhoods (networks) to connect and communicate. The ISP assigns a single public IP address to each neighborhood (network), acting like the main address that identifies the entire neighborhood to the outside world (internet).
This analogy emphasizes that the ISP provides the overall infrastructure and a single public IP for your network,  similar to how a city provides infrastructure and a main address for a neighborhood.
## How Addressing Works, IPv4, MAC 
An IP Address is a sequence of numbers assigned to devices. It's basically your address on the network you are into, just it. To make it simple at the beginning, let's start with this concept but don't get to attached to it , it isn't wrong but isn't explained properly either. If you have an image in your mind of the IPs like real house addressing, I'd recommend to you not focus just on the house, because just the house number is not sufficient to get located, you need the street address, city address, state address, country address and even the planet you are into. I think that is more similar to the Internet and Networks concepts. 

An IPv4 is a number of length of 32 bits assign to every devices connect to an network, it's was something unique, two different devices can't have the same IP. Do you have notice that I've used the word "was"? Yes, because it have changed when NAT and the concept of Public and Private Networks arrives and now you only can't have the same IP in the same network. For example, your friend's PC is connect to his home network and now his PC have the IP 10.10.10.99, you go to his house and connect your phone on his network, you can't have the same 10.10.10.99, the router will assign to you an different IP that isn't currently in use. Of course, two different people can't have the same ID. But imagine that if IDs are separated depends on the gender, one man can have the ID 100 and an woman can have the ID 100 as well, that don't mean they are the same person. Translating now, the gender plays the role of the network you're currently into. If you and your friend are on different networks, you two can have the same 10.10.10.99, it's the same number but in different networks(genders or whatever you are thinking), they are unique numbers inside of yours currently PRIVATE network.


every eight bits are separated by a dot. It’s possible to have around 4 billion addresses in a number range of this size, but the world have around of 5 billion or more persons using internet, so…How?? You right, it isn’t possible and that’s why between 2011 and 2018 the IPv4 addresses started running out and the new IPv6 was introduced to add trillions of new addresses, the transaction between IPv4 and IPv6 is still running and will take years to be completed. 

That is the difference between them: 
> 2 ^ 32 IP addresses (4.29 billion)
> -------------------------------
> 2^128 of IP addresses (340 trillion-plus)
> 


CIDR MAKE POSSIBLE TO MANIPULATE THE SUB NET MASK WHATEVER VALUEB AUNDIAN
Assim, os endereços IP de hospedeiros dentro da organização compartilharão o prefixo comum, o que reduz consideravelmente o tamanho da tabela de repasse nos roteadores, visto que um único registro da forma A.B.C.D/X será suficiente para transmitir pacotes partindo de fora para qualquer destino dentro da organização.
Uma sub-rede de classe C (/24) poderia acomodar apenas 28 - 2 = 254 hospedeiros (dois dos 28 = 256 endereços são reservados para uso especial). Essa sub-rede é muito pequena para muitas organizações, por outro lado, uma sub-rede de classe B (/16), que suporta até 216 - 2 = 65.534 hospedeiros, seria demasiadamente grande. Com o endereçamento de classes cheias, uma organização com 2.000 hospedeiros recebia um endereço de sub-rede de classe B (/16), o que resultava no rápido esgotamento do espaço de endereços de classe B e na má utilização do espaço de endereço alocado.

Os 2 endereços especiais de uma sub-rede que não podem ser utilizados são o primeiro e o último endereço da faixa de endereços da organização. O primeiro é reservado para o endereço de rede, que identifica a rede como um todo. Nele, todos os bits que não fazem parte do prefixo de rede recebem o valor 0.

Já o último endereço é utilizado como endereço de difusão (broadcast). Roteadores não repassam mensagens de difusão, portando, em uma rede IP a difusão fica limitada ao segmento de rede limitado pelo roteador. No endereço de difusão, todos os bits que não fazem parte do prefixo de rede recebem o valor 1.

bit da rede bits da sub rede bits de hosts

Uma rede pode ser dividida em diversas partes para uso interno, continuando a ser vista como uma única rede externamente. Essas partes são as sub-redes.

Existem diversas razões para se dividir uma rede em sub-redes. Algumas destas razões são:

Isolar o tráfego de uma sub-rede, reduzindo assim o tráfego total da rede.
Proteger ou limitar o acesso a uma sub-rede.
Permitir a associação de uma sub-rede com um departamento ou espaço geográfico específico.
A -> a lot of different networks addresses but just few host addresses per network 
B -> up side down
C -> entire
Subnet mask defines a network portion of the ip address and what remains is the hosts portion
Imagine a 32-bit IP address divided into two parts: network and host. The subnet mask defines how many bits belong to the network portion. In CIDR notation, the number following the slash indicates the number of bits set to 1 in the subnet mask (remember, 1s represent the network part).
Here's an analogy to solidify the concept:

Imagine a large apartment complex (the network) with several buildings (subnets). Each building has its own unique address (network address), and each apartment within a building has its own number (host address). The CIDR notation acts like a shorthand, specifying the complex's address (IP address) and the number of floors in each building (subnet prefix length), implying the total number of apartments (usable host addresses) within each building.
For instance, in 192.168.1.0/24, the first 24 bits define the network address (192.168.1), leaving the remaining 8 bits for host identification (255 possible hosts).

In conclusion, CIDR is a critical innovation in IP addressing. By enab
a,b,c -> problem
a -> provided vast number of networks but limited hosts per network
5 classes A -> E //
A,B,C are commonly used and class D is only used for ~multicast~. E for experimental purposes.
![](Network/attachments/Pasted%20image%2020240416111518.png)
For example, if an Internet Service Provider (ISP) is assigned a “/16”, they receive around 64,000 IPv4 addresses. A “/26” network provides 64 IPv4 addresses. The lower the number after the oblique, the more addresses contained in that “block”.
These host addresses are the IP addresses that are necessary to connect your machine to the Internet.
Public vs. Private IP Addresses:

ISP's Public IP Allocation: The 64,000 usable addresses you mentioned (from the /16 allocation) are public IP addresses. These are assigned by your ISP and identify your entire network on the vast internet.

Router's Private Network: Your router, when connected to the ISP, doesn't directly use these public addresses. Instead, it creates a private network using a private IP address range (like 192.168.1.0/24). This private network exists behind your router's firewall and is not directly routable on the public internet.

What Happens When You Connect Your Router:

One Public IP Address: Your ISP typically assigns a single public IP address to your connection. This address identifies your entire home network to the internet. Think of it like your house number on a street.

Many Private IP Addresses: Inside your home network, your router uses its private IP address range (e.g., 192.168.1.0/24) to assign unique private host addresses to all your devices (computer, phone, etc.). These addresses allow your devices to communicate with each other and the router for internet access. Imagine these as apartment numbers within your house.

ISP's Address Pool and Your Usage:

No Impact on ISP's Pool: Connecting your router with its private network doesn't affect the ISP's pool of 64,000 public IP addresses. They still have that entire range available for assigning to other customers.

Limited Devices on Your Network: Even if you connect 63,999 devices to your router (highly unlikely in a home setting!), it wouldn't affect the ISP's public IP address pool. These devices all share your single public IP address for internet access, but they use unique private IP addresses within your home network.

In essence:

Your ISP assigns a single public IP address to your network.
Your router creates a private network with its own private IP address range for your devices.
Connecting your devices to your router doesn't affect the ISP's public IP address pool.
I hope this clarifies the concept of public vs. private IP addresses and how they function in your home network!

Imagine an apartment complex (the network) with a single main address. This complex can be further divided into buildings (subnets). Each building has its own set of apartment numbers (host addresses) for individual tenants (devices).

I hope this clarifies the concept!
CIDR to the Rescue:

CIDR overcame these limitations by introducing two key concepts:

Subnet Masks: A subnet mask defines the network portion of an IP address. In CIDR, subnet masks can have variable lengths, allowing for the creation of subnets with the exact number of addresses needed, regardless of class.
CIDR Notation: This compact notation combines an IP address with a forward slash (/) followed by the number of bits in the subnet mask (e.g., 192.168.1.0/24).

A network numbered “10.0.0.0/8” (which is one of those reserved for private use) is a network with eight bits of network prefix, denoted by “/8” after the oblique. The “8” denotes that there are 24 bits left over in the network to contain IPv4 host addresses: 16,777,216 addresses to be exact.

Class A Network:

IP range is (1–127) 1.0.0.1 to 126.255.255.254
An example of a Class A address is 102.168.212.226.
Here, “102” helps you identify the network, and 168.212.226 identifies the host.
Supports 16 million (2²⁴)hosts on each of 127 networks.
Used for a large number of hosts.
Class B Network:

IP range is (128 to 191) 128.1.0.1 to 191.255.255.254
An example of a Class B IP address is 168.212.226.204.
Here “168.212” identifies the network and “226.204” helps you identify the network host.
Supports 65,000 (2¹⁶) hosts on each of 16,000 networks.
Used for medium-size networks.
Class C Network:

IP range is (192 to 223) 192.0.1.1 to 223.255.254.254
An example of a Class C IP address is 192.168.178.67
Here “192.168.178” identifies the network and “67” helps you identify the network host.
Supports 254 hosts on each of 2 million networks.
Used for local area network.
Class D Network:

IP range is (224 to 239) 224.0.0.0 to 239.255.255.255
An example of a Class D IP address is 227.21.6.173
Reserve for multi-tasking and never used for regular networking operations.
Class E Network:

IP range is (240 to 254) 240.0.0.0 to 254.255.255.254
An example of a Class E IP address is 243.164.89.28
Reserved for future use, or research and development purposes
 CIDR stands for Classless Inter-Domain Routing. this defines a suffix that is a number between 0 and 32 and it is used to show how many bits represent the network.
An part of IPv4 can identify the network you are into.
~CIDR -> A.B.C.D/X 
X -> how much bits the first part of the address have.(prefix)

router -> public ip address 


Networks has two types:

- Private Network
- Public Network

Public Networks are Networks that anyone can access, like in airports, coffee shops or an park.

Private Networks are Networks like in your house, or Networks like companies uses.

## **Public**

Connect to a public Network can be a much less secure than a private network because it’s unclear who else is connect to the network too or who set the network. The data that you receive or you send ca be compromise and be sended to other location that you don’t want.

Imagine the translator, you wanna send an secret to your new friend. Then, what you do is, send your secret to translator and asks him to pass to your friend. But the translator is configured to be Public and other person who it was seeing what you were sending asks to translator what you sent to him. The translator asnwers your secret to other person( Because anyone can asks or can be asnwer for him ). Compromise and infiltrate in this type of Network is much easier than Private Network. But in an Private Network, the translator knows that just you and your friend is inside the network and anyone else is out. Then, when you request the translator to send your secret to your friend and other person asks him what you send to , the translator doesn’t asnwer because he know that this other person is not inside the network!

But if this other person grab my secret or hear it while i talk to translator? Well, this is one topic to another hour :) 

## **Private**

There are a few challenges associated with setting up a private network. Is more expensive to establishing and do this properly so that doesn’t have any gaps and the connection works well

Now, i’m going to explain about how can we indentifying devices on a network!

imagine us, humans, we have a lot of types to indentify each other, but focus in these two

- **Fingerprint**
- **Name**

what is the difference between these two?

well, i can talk a lot of differences but i want that you only think about it as a: the name you can change through deed poll but your fingerprint or anything like this you wouldn’t change.

but us we talking about networks! Yea Yea, networks has these two types( maybe has more but i’m only going to talk about these two )

- **MAC Address**
- **IP Address**

~ that is the topic that i'm into right now !


## Media Access Control

imagine that the MAC Address is the fingerprint, MAC Address is an sequence of 6 hex decimal numbers divided by five columns ( hex decimal values range from #00 to #ff, two hundred and fifty-five possible values ).

Devices on a network will all have a physical network interface, which is a microchip board found on the device's motherboard. And this network interface on the motherboard is assigned with the unique MAC Address at the factory it was builded.

> **a4:c3:f0:85:ac:2d**
> 

the first three digits are the company who build this interface and assigned it with this MAC Address, in this case is Intel. And the last three digits are the unique address to your network interface.

You know into hotels, coffee shops when you try to connect in the Public Network and you need to pay to access it?? Even connect on the wifi, you can’t access Internet.

Look at this site [here](https://tryhackme.com/room/whatisnetworking).

( In Task3 click in “View Site” Button  )

Alice pays to access internet in this Public Network but Bob doesn’t, so try to “Request site” and see what is gonna happen when Bob tries to connect to Internet.

Now, try to change the bob’s MACAddress to the sm  e as Alice and see what happens!


Even though each network interface only has one of these, there is a technique called “spoofed”, you can search about this if you want. I won’t talk much about this technique because i’m not sure if know with everything about it. Probaly in the final of this “Write-up” i’ll write how this technique works and i’ll try to make it too, if it’s really possible.

But imagine a firewall, that is configured to allow any communication going to and from the MAC address of the administrator inside network. If other device “spoof” this MAC address, the firewall would think that is receiving informations from the administrator when it isn’t. And about IP Address? Let’s talk about him now.

## IP Addresses.

## Two types of IP Addresses

Exist two types of IP addresses: Public and Private, but first, let's split up precisely what an IP address is in the diagram below from TryHackMe:

!https://tryhackme-images.s3.amazonaws.com/user-uploads/5de96d9ca744773ea7ef8c00/room-content/a0de0d68641982ddf1a8c5a9f1984c4c.png

An ip address is a sequence of numbers that are divied into four octets. This Number is calculated through a technique known as IP adressing and subnetting( i don’t know how it works sorry ). IP adressing can change from device to device but cannot be active in the same time in the same network.

IP addresses follow a few rules like protocols to communicate in the same language, but what is important into is depending on where the device are will determine what type of IP address they have: Public or Private.

Basically an Public IP is used to identify a device on the Internet and an Private IP is used to indetify a device amongst other devices in the same network.

| Device Name    | IP Address   | IP Address Type |
| -------------- | ------------ | --------------- |
| DESKTOP-KKJKKJ | 192.168.1.77 | Private         |
| DESKTOP-KKJKKJ | 86.157.52.21 | Public          |
| mooraeskkj-PC  | 192.168.1.74 | Private         |
| mooraeskkj-PC  | 86.157.52.21 | Public          |

Look at this table above, i’m sure that you saw that these two different devices have the same Public Address,i’m going to explain it now. As i said, an Public IP is used to indentify a device in the Internet, so any data sent to internet from these devices will pass through the Provider and your Provider will make the request to Internet. This mean that Public Ip addresses are given by our Internet Service Provider :) 










Imagine when you want to search something on google, you open your browse and type “www.google.com” 

but it’s actually like this(just imaginary numbers) 

www = 192.123.9.1 

**L**    google = 192.8.8.8

**L**  com - type of domain ( tld ) 

so, what your browser are doing is accessing the repository www where are storage the page that you want to access, then inside of this repository he search about the address that you send to him and get the information from this address. Your browser read all information and show to you after loaded. But imagine how boring it would be if we need to especify and memorize all sequences of numbers from websites that we want to access.

In wich case who translate these addresses for us is the DNS( Domain Name System ), but that’s a topic for another time.

# Domain And TLD

An TLD(top-level domain) is a type of domain(obviously) but first, before i introduce you in TLD topic, let me explain a little bit more about domains.

we have three types of domain, are they:

- sub-domain
- domain name
- top-level-domain

look at this address: **www.google.com,** as i said before this is a sequence of addresses disguised by dns but now i’m talking about domains so let’s continue with it 

- **.www -** sub domain
- **.google -** domain name
- **.com -** top-level-domain

the name of this separation is called by domain extension and just reading the domain extension we know that this site is a comercial site. :)

Wait, how?

yea, the top-level-domais are coordinated and organized by ICANN and i’ll tell you how they organize it.

probably have more than three but i’m only going to talk about three :)  

- **gTLD**
- **sTLD**
- **ccTLD**

## Generic Top Level Domain: gTLD

is the most common type that let everyone make a registration. the most common are:

- **[.com](https://www.hostinger.com.br/tld/dominio-com)** – comercial sites.
- **[.org](https://www.hostinger.com.br/tld/dominio-org)** – organizations.
- **[.net](https://www.hostinger.com.br/tld/dominio-net)** – for networks.
- **[.xyz](https://www.hostinger.com.br/tld/dominio-xyz)** – general use.

and much more like this.

# **2. Sponsored Top-level Domain : sTLD**

however, there are gTLDs restricted to general use, sTLD is a generic type wich is used by private organizations and is required a few rules to register your website in this type of domain.

- **.gov** – government sites.
- **.edu** – institutions educational.
- **.mil** – US army.
- **.post** – postal services.

# **3. Country Code Top-level Domain: ccTLD**

this type of TLD is basically the ISO(two-letter abreviation) code of a country.

- **[.com.br](https://www.hostinger.com.br/tld/dominio-com-br)** – Brazil.
- **[.es](https://www.hostinger.com.br/tld/dominio-es)** – Spain.
- **.ru** – Russian
- **[.us](https://www.hostinger.com.br/tld/dominio-us)** – US.
- **[.eu](https://www.hostinger.com.br/tld/dominio-eu)** – EU.
- **[.ca](https://www.hostinger.com.br/tld/dominio-ca)** – Canada.
- **[.nl](https://www.hostinger.com.br/tld/dominio-nl)** – Netherland

now you know wich type of site you are acessing just reading the address.