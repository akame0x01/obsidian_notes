# What is the Internet?

Is quite hard to explain what is in fact the Internet but think about it like a big and massive big and sub networks connect together with a lot of different devices between them making it possible. 
`Another way to understand the internet is as an network infrastructure that delivery services to make web applications exchange information. The internet itself makes some things easier for you, like defining a path from you to destination, correct possible errors while traveling and so on. Services provided by internet make possible devs put all their effort making their own features.` 

The internet as we know it nowadays was created by Tim Berners Lee in 1989, called by World Wide Web(www).

# OSI Model, TCP/IP Model, Layers and how the data is transferred.

First, model is different from architecture. OSI is a model to get some ideas(roughly speaking), TCP/IP is a architecture and needs to be followed exactly how it is described. 

Osi model is not used anymore, but it can be useful to understand what is a model and their respective layers.  Each layer in any model or architecture, be it TCP/IP or OSI, have layers, each layer uses different protocols, interfaces, services and so on. Each layer provides services to the layer above and consume the services from the layer below through a interface.
Communication vertical and horizontal, is how the communication between the layers occurs. Vertical is when an layer transfer the data to the layer above through an interface, that means the communication is going down(vertical). Now talking about horizontal communication, is the communication between the same layers, but NOT directly. For example, imagine an package is being transfer from an user1 to user2 and imagine there is a layer called layer_x that have a protocol to pick up this package data and add a header called md5_hash, this header is used to check if the data on the package wasn't manipulated or changed while being sent, then after layer_x sent the current data with his header to the layer_y that will transform the data from bits to light and send it through a cable. The data arrives at the user2 device and the layer_y again is responsible to get that light coming from the cable, organize and throw up to the layer above him, which is the layer_x. Layer_x is the layer responsible to create the md5_hash to check errors, it creates a new hash and compare the new hash with the one that come with the data! And that's when the communication between layer_x on user1 and layer_x on user2 occurs!!! `
`Take a look at CRC and another algorithms to check for erros transfering packages`

I've used a expression "add an header", but the it has an name and doesn't occur that way simple adding a header. The name of this operation is called by encapsulation, each layer do this process and after the encapsulation the data transform itself in a pdu(protocol data unit) to be read to the same layer on the machine of the person who made the request(Horizontal communication).

Talking about the layers and its functionalities. #layers
Now coming back to OSI model, layers from 7 to 3(Application , Presentation ,Session , Transport ,Network) are all implemented in software levels, it can be a program or even the operation system but they are in the software level. The 2 layers below network layer(Data-Link and Physical) are implemented in hardware level, Data-Link layer uses drives so it can be in software level too but whatever. (Transport layer is the goat of all of them ngl bro do almost everything)

`Application Layer` is where USER have a interaction with the services, like on browsers, emails, streaming apps and so on.

`Presentation Layer` make possible the communication regardless if the device is a pc, mobile or a tv. That mean the Presentation Layer receives the data from the Application Layer and convert it into a format and syntax that is more readable from other device. Is more like a translator, this layer deals with cryptography, compression and conversion of the data being sent.

`Session layer` control who on the network will sent or receive the data and how(dialogue control) and create backup points to in case of lost connection.
(This 3 layers are put together in the TCP/IP model and it's a developer's job make this functionalities)

`Transport layer` segment the data, does the Flux Control, delivered the data to the correct process that have called it(using the port numbers), check and correct errors if they occurred while the data are being transferred due to interference or even attacks like main in the middle :). If you are curious about how errors are found and how they are fixed, check the [CRC And Hashing Checks](Network/CRC%20And%20Hashing%20Checks.md) note.

`Network layer` this layer has two main function, one is breaking up segments of the data depending how the data will be transferred and reassembling on the receiving end. The other is addressing and discovering the best path across physical network(I should search how it is done and make a note about it!)

`Data-Link layer` I didn't understand this too much but looks like this layers is used to correct errors too, but in more "low level". That means this layers deals with checking and correcting errors in the communication pc->router or router->ISP or router->router and so on, until the data arrives on the destiny. This layers is responsible to organize how the data will be sent from physical layers like delimiters. Check this link out to understand more [geeksforgee_data_link_layer](https://www.geeksforgeeks.org/data-link-layer/)

`Physical layer` deals with the data being transferred, it can be done using optical fiber(sending light pulses) or using the air in wireless connections. Defines the velocity that the data will be transfer(Mbps), sync the data and defines how the data will be transferred using models like simplex, half duplex or full duplex.

TCP/IP Architecture use only five from these layers, as I probably have said before, if I said that they have collapse some layers to make the TCP/IP Architecture it would be a lie, because TCP/IP created before OSI Model, that doesn't they are completely different. They are very similar, TCP/IP just have less layers.  
# Protocols on TCP/IP Architecture, roughly speaking.

Each Layers uses different protocols, you can think about the models are like a stack of different protocols. Application layer use DNS, HTTP, SMTP, DHCP, RTP or FTP, the protocol used depends on which task/service you are using, which one has it own purpose, these protocols are implemented using two different architectures, Client-Server or P2P(Peer to Peer). The Network layer in the TCP/IP model use two different protocols, TCP and UDP, roughly speaking TCP is more accurate and slow(3 way handshake), because it needs to make sure that there is no error at all and other functionalities and UDP is all go and fuck it. This image below tell everything you need to know :D. 
![](Network/attachments/Pasted%20image%2020240413152000.png)
`UDP` - we hope you receive the data.

Internet layer uses the IP(Internet Protocol), as you already know, it can be IPv4 or IPv6, look at this note [Basic concepts](Network/Basic%20concepts.md) to some concepts about address. This Layer can use ICMP, ARP, IGMP protocols as well. The Network Access Layers don't give a fuck about which protocol you use, it just needs something that send the data and I'm not kidding, is literally that way.(Search about IEEE 802, is a model used to define a protocol used in this layer, defines patterns to Ethernet and WIFI connections).
# Application and Transport layer. 

HTTP keep-alive, it can make you misinterpret because of the name, this connection doesn't stay always alive, what is difference from the default is that it can send or make MORE THAN ONE request without closing. 

Take a look at this article if you want to see why you should not use TCP and UDP connections at the same time, roughly, TCP has that little thing with sync and yours sliding window to send packages and how it affect the performance while sending packages, read this little article with you want to know more about it. [article-about-tcp-and-udp-connections](https://web.archive.org/web/20160103125117/https://www.isoc.org/inet97/proceedings/F3/F3_1.HTM#ref1)


~ need to talk about sliding windows before talk about selective repeat and go-back-n technique.
~ explain 3 way handshake.
~ CRC(another note).

selective repeat is a technique that tcp uses to avoid erros, packages are resend the exactly packages that are missing but it cost hardware resources to crontrol exactly wich package has errors or are missing. Another way that TCP uses is the go-back-n technique, when an error occurs or an packare is missing to complete the window, this technique makes the router resend all packages that comes after the error, that means more space is used because packages that have arrived with no error is being resending. For example, imagine you are sending ten packages, you have sent all the packages but somehow the package number 4 and the package number 7 didn't arrived, if you are using the selective repeat the router will compute and resend just the packages number 4 and 7, in the other way, if you are using the go-back-n it will resend all packages after the package number 4.

starting:
syn(seq number client) -> syn+ack(seq number server and length) -> ack(client)
finishing:
ack+fin(client) -> ack(server)

About the Network Layer, if you want to get a better understanding about how IPs are assigned, Public and Private Networks, how NAT works and more about these stuff, read this note linked below. Here, in this note, I'm going to focus more on protocols and more low level concepts. [Basic concepts](Network/Basic%20concepts.md)

## Network Layer and its protocols 

