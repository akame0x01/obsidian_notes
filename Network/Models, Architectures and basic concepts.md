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

Layers as service providers and consumers: Each layer acts as both a service provider and a service consumer. 
Service Provider: A layer offers specific functionalities to the layer ABOVE IT.
Service Consumer: A layer use the services provided by the layer BELOW it to perform its task. The Data-Link layer, for example, uses the error-free transmission service offered by the Physical layer.

Talking the functionalities now. #layers
Now coming back to OSI model, layers from 7 to 3(Application , Presentation ,Session , Transport ,Network) are all implemented in software levels, it can be a program or even the operation system but they are in the software level. The 2 layers below network layer(Data-Link and Physical) are implemented in hardware level, Data-Link layer uses drives so it can be in software level too but whatever. (Transport layer is the goat of all of them ngl bro do almost everything)

`Application Layer` is where USER have a interaction with the services, like on browsers, emails, streaming apps and so on.

`Presentation Layer` make possible the communication regardless if the device is a pc, mobile or a tv. That mean the Presentation Layer receives the data from the Application Layer and convert it into a format and syntax that is more readable from other device. Is more like a translator, this layer deals with cryptography, compression and conversion of the data being sent.

`Session layer` control who on the network will sent or receive the data and how(dialogue control) and create backup points to in case of lost connection.
(This 3 layers are put together in the TCP/IP model and it's a developer's job make this functionalities)

`Transport layer` segment the data, does the Flux Control, delivered the data to the correct process that have called it(using the port numbers), check and correct errors if they occurred while the data are being transferred due to interference or even attacks like main in the middle :). If you are curious about how errors are found and how they are fixed, check the [CRC and errors algorithms](network/CRC%20and%20errors%20algorithms.md) note.

`Network layer` this layer has two main function, one is breaking up segments of the data depending how the data will be transferred and reassembling on the receiving end. The other is addressing and discovering the best path across physical network(I should search how it is done and make a note about it!)

`Data-Link layer` this seems to be the same as the Transport Layer, but they are different. This layer focus more in the data transfer within a single network segment(local networks), so it does roughly "the same" as Transport layer but only within local networks, they become useless if when comes to out of an local network. The two main protocols this Layer uses are the Ethernet and Wi-Fi.

`Physical layer` deals with the data being transferred, it can be done using optical fiber(sending light pulses) or using the air in wireless connections. Defines the velocity that the data will be transfer(Mbps), sync the data and defines how the data will be transferred using models like simplex, half duplex or full duplex.

TCP/IP Architecture use only five from these layers, as I probably have said before, if I said that they have collapse some layers to make the TCP/IP Architecture it would be a lie, because TCP/IP created before OSI Model, that doesn't they are completely different. They are very similar, TCP/IP just have less layers.  
# Protocols on TCP/IP Architecture, roughly speaking.

![](network/attachments/Pasted%20image%2020240507083634.png)

Each Layers uses different protocols, you can think about the models are like a stack of different protocols. Application layer use DNS, HTTP, SMTP, DHCP, RTP or FTP, the protocol used depends on which task/service you are using, which one has it own purpose, these protocols are implemented using two different architectures, Client-Server or P2P(Peer to Peer). 

The Transport layer in the TCP/IP model use two different protocols, TCP and UDP, roughly speaking TCP is more accurate and slow(3 way handshake), because it needs to make sure that there is no error at all and other functionalities and UDP is all go and fuck it. This image below tell you everything you need to know :D. 
![](network/attachments/Pasted%20image%2020240413152000.png)
`UDP` - we hope you receive the data.

You may think that uses both connections at same time can be useful sometimes but take a look at this article if you want to see why you should not use TCP and UDP connections at the same time, roughly, TCP has that little thing with sync and yours sliding window to send packages and how it affect the performance while sending packages, read this little article with you want to know more about it. [article-about-tcp-and-udp-connections](https://web.archive.org/web/20160103125117/https://www.isoc.org/inet97/proceedings/F3/F3_1.HTM#ref1)

Talking about sliding windows in TCP connections: Imagine that you are sending a bunch of pages(data segment) from an document(data itself) to one friend, Sliding windows will help you managing the flow of the pages to avoid overwhelming your friend and avoid errors. 

Each segment receive an unique sequence number, like page numbers, it will help to identify the order if they arrive in the wrong way. The window is how many pages(segments) the sender is allowed to send at the same time, it can be adjust during the TCP connection based on network conditions and other factors.

How it works:

We have the sender and the receiver, the receiver have an buffer with memory of 4K bytes. 
The sender sends an segment of data of 1KB with an flag indicating that is the first of the sequence.
Receiver get that segment and send an package with an ACK flag equal to 1024 indicating that he received the segment and WIN flag indicating the length of buffer available at moment.
![](network/attachments/Pasted%20image%2020240507092755.png)

There are two main algorithms that are being used to deal with errors in sliding windows:

Selective Repeat ~ Within a window, it can recognize which package has an error or is missing and ask for only that package. It means that the same package isn't sent two times.

Selective Repeat ~ If there's an error in receiving any segment, you need to resend all the papers after the error, not just the missing one. So for example, if you have a sliding window that can handle ten segments and the third segment is missing, the sender will send the segments 3-10 all again. 

~ little note: HTTP keep-alive, it can make you misinterpret because of the name, this connection doesn't stay always alive, what is difference from the default is that it can send or make MORE THAN ONE request without closing. 

I'm tired to study networks already so I'm just leaving an AI generated text to explain the 3 way handshake and thats all

## 3 Way Handshake 

```
The three-way handshake is a fundamental mechanism in TCP connections that establishes a reliable communication channel between two devices on a network. Here's a detailed explanation with more technical aspects:

The Players:

Client: The device initiating the connection (e.g., your web browser when you try to access a website).
Server: The device providing a service and waiting for connections (e.g., the web server hosting the website).
The Steps:

SYN (Synchronize):
The client initiates the handshake by sending a segment with the SYN flag set. This flag indicates that the client wants to establish a connection and also includes a client-side initial sequence number (ISN). The ISN is a random value used for sequencing data segments during the communication.
SYN-ACK (Synchronize-Acknowledge):
Upon receiving the SYN segment, the server acknowledges the connection request by sending a segment with both the SYN and ACK (Acknowledge) flags set. The server also includes its own server-side ISN and an acknowledgment number that equals the client's ISN + 1. This acknowledges the client's initial sequence number and indicates the server's starting point for receiving data.
ACK (Acknowledge):
Finally, the client sends a segment with only the ACK flag set, acknowledging the server's SYN-ACK segment and its ISN. The acknowledgment number in this segment is set to the server's ISN + 1.
What Happens Behind the Scenes:

Sequence Numbers: These randomly chosen ISNs are crucial for reliable data transfer. They act as starting points for sequencing data segments sent during the connection. Each segment carries a sequence number that allows the receiver to identify missing segments, reorder them if necessary, and detect duplicate segments.
Acknowledgment Numbers: The ACK flags and acknowledgment numbers confirm that the previous segments were received successfully. This two-way acknowledgment process ensures reliable data exchange.
After the Handshake:

Once the three-way handshake is complete, a TCP connection is established. Both the client and server can now exchange data segments with sequence and acknowledgment numbers, enabling reliable communication.

Additional Details:

The ISNs chosen by the client and server are typically random values to improve security by making it harder for attackers to predict sequence numbers and potentially inject malicious data into the connection.
TCP uses timers to ensure timely responses during the handshake. If a segment (SYN or ACK) is not received within a timeout period, the process is restarted.
In some network environments, firewalls or proxies might perform TCP connection inspection, which can introduce slight variations in the handshake process.
Benefits of the Three-Way Handshake:

Reliability: Ensures both parties are ready to communicate and establishes synchronization for data exchange.
Security: Helps prevent unauthorized connection attempts and potential data corruption by using unpredictable sequence numbers.
Efficiency: Minimizes the number of messages exchanged compared to older connection establishment methods.
I hope this detailed explanation provides a clear understanding of the three-way handshake in TCP connections! Feel free to ask if you have any further questions about specific aspects of the process.
```

```

Virtual circuits and datagrams are two fundamentally different approaches to data transmission in networks. Here's a breakdown of their key differences:

Virtual Circuits (Connection-Oriented):

Concept: Imagine a dedicated communication channel established between two devices, similar to a phone call. Data travels reliably along this pre-defined path.
Characteristics:
Connection Setup: Requires a connection establishment phase (like a three-way handshake in TCP) before data transfer can begin.
Routing: Path between devices is predetermined during connection setup, offering a more reliable route for data flow.
Flow Control: Mechanisms ensure the receiver can handle the incoming data rate, preventing buffer overflows.
Error Control: Techniques like acknowledgments and retransmissions guarantee in-order delivery of data packets.
Order: Data packets are delivered in the same order they were sent.
Protocols: TCP (Transmission Control Protocol) is a common example of a virtual circuit protocol.
Datagrams (Connectionless):

Concept: Think of sending individual postcards; each data packet is treated independently and routed dynamically through the network.
Characteristics:
No Connection Setup: Data transmission can begin immediately without any prior handshake.
Routing: Each data packet (datagram) is routed independently based on its header information, offering flexibility but potentially less predictable delivery paths.
Limited Flow Control: Datagram protocols might rely on application-level flow control mechanisms, as there's no guaranteed communication channel.
Limited Error Control: Error detection and retransmission might be less robust compared to virtual circuits, leaving some responsibility for reliable delivery to the application layer.
Order: Datagrams might not be delivered in the same order they were sent due to independent routing.
Protocols: UDP (User Datagram Protocol) is a common example of a datagram protocol.
Here's an analogy to illustrate the difference:

Virtual Circuit: Like a dedicated phone line, you have a pre-established connection for reliable conversation. Both parties know who they're talking to, and the conversation flows smoothly.
Datagram: Like sending postcards, each message is independent. The recipient might receive them in a different order, and there's no guarantee they'll all arrive.
Choosing the Right Approach:

The choice between virtual circuits and datagrams depends on the specific needs of the application:

Virtual Circuits: Preferred for applications requiring reliable and ordered data delivery, like file transfer or web browsing.
Datagrams: Suitable for applications prioritizing speed and efficiency over guaranteed delivery, like real-time streaming (video/audio) or online gaming, where occasional packet loss might be tolerable.
I hope this explanation clarifies the key differences between virtual circuits and datagrams!

An ICMP was created to communicate erros in the network. There are some of them you should search about them later but i'm tired of this topic fuck this all :D