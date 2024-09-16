# Badass
The purpose of this project is to simulate a network and configure it using GNS3 with docker images.

## Documentation

[GNS3](https://docs.gns3.com/docs/)  
[FRRouting](https://frrouting.org/doc/)  
[RFC 7348](https://datatracker.ietf.org/doc/html/rfc7348)  

<details>
<summary>Overview</summary>

```bash
├── P1
│   ├── build_docker.sh
│   ├── P1.gns3project
│   ├── pjay_alpine_host
│   └── pjay_frr_router
├── P2
│   └── P2.gns3project
└── README.md
```
</details>

## How to run it
You need to have gns3 and docker installed.

Firstly build all the image by doing a `./build_docker.sh`
Unzip the compressed files that start with the folder name.
Then open a project in gns3 and import the files at the root of the uncompressed folder.  

## Project
<details>
<summary>Part 1</summary>

In this part we shall deploy 2 machines: 1 router and 1 host.  
For the router we'll use an [FRRouting](https://frrouting.org/doc/) image and configure it by modifying the daemons file to ensure to enable those services:

+ BGPD daemon  
+ OSFPD daemon  
+ IS-IS daemon

Then, run the project. Open a terminal in the router, the command `ps a` should show those daemons running.  
</details>

<details>
<summary>Part 2</summary>

The second part is about configuring a [VXLAN](https://en.wikipedia.org/wiki/Virtual_Extensible_LAN) (Virtual eXtensible Local-Area Network).  
</details>

<details>
<summary>Part 3</summary>
</details>

<details>
<summary>Glossary</summary>

+ **VXLAN**: **V**irtual e**X**tensible **L**ocal-**A**rea **N**etwork
+ **EVPN**: **E**thernet VPN
+ **BUM**: **B**roadcast unknown **U**nicast **M**ulticast
</details>
