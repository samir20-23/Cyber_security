 <div id="header" align="center">
  <img src="https://media2.giphy.com/media/v1.Y2lkPTc5MGI3NjExbXBzaXdoa284M3IxMm1naG5vN3Exbmt2aWVsNzU0YTFmOGdsZDFiZiZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/4jEmDP26dZXuyytRAk/giphy.gif" width="400"/>
       </a>
</div>
## **README: How to Run `.bat` Files Without Warnings (Windows)**

### **Introduction**
This guide explains how to run `.bat` files on Windows without encountering the SmartScreen warning. It includes steps to disable SmartScreen temporarily or permanently remove warnings by digitally signing your files. If you prefer not to see the warnings, follow the instructions below carefully.

---

### **How to Disable Windows SmartScreen (Temporary Method)**

To avoid seeing the warning **"Windows protected your PC"**, you can temporarily disable SmartScreen.

1. **Open Windows Settings**:  
   Press `Win + I` to open the **Settings** menu.

2. **Navigate to Windows Security**:  
   Go to **Privacy & Security** > **Windows Security** > **App & Browser Control**.

3. **Disable SmartScreen**:  
   Under **Check apps and files**, select **Off**.

   ![SmartScreen Settings](https://path/to/your/screenshot_or_gif.gif)  *(Insert a gif here showing how to disable SmartScreen)*

Once disabled, you should be able to run `.bat` files without the warning. Remember to **enable SmartScreen** again after running the trusted file for added security.

---

### **How to Digitally Sign Your `.bat` File (Advanced Method)**

If you want to permanently avoid the SmartScreen warning for trusted files, you can **digitally sign** your `.bat` files.

1. **Get a Code-Signing Certificate**:  
   Purchase a certificate from a trusted provider like Symantec, DigiCert, or Comodo.

2. **Sign the `.bat` file**:  
   You can use **SignTool** to add a valid digital signature to your file. Run the following command:

   ```bash
   signtool sign /a "C:\path\to\your\file.bat"
   ```

   This will sign your `.bat` file, making it trusted and preventing SmartScreen warnings in the future.

   ![Signing Process](https://path/to/your/screenshot_or_gif.gif)  *(Insert a gif here showing how to sign the file)*

---

### **How to Run `.bat` Files as Administrator**

If you'd like to run a `.bat` file as an administrator (with higher privileges), follow these steps:

1. **Right-click the `.bat` file**.
2. Select **Run as administrator**.

   This method won’t necessarily disable SmartScreen but may allow your file to execute without any restrictions.

---

### **Important Notes**
- **Only disable SmartScreen for trusted files**. Disabling it can expose your computer to security risks.
- **Digitally signing** your files adds an extra layer of security and trust, which is recommended for permanent use.
- **SmartScreen** helps protect your PC from untrusted apps and potential malware, so it’s important to only bypass it for files you trust.

---

### **Conclusion**
Following the steps above, you should be able to run your `.bat` files without receiving the Sma 

<div id="header" align="center">
  <img src="https://media1.giphy.com/media/8dPbkqUb2p5XTvIXLx/giphy.webp?cid=ecf05e47mbn3dd55rnvco4s4shss53vauqpq0nvvo5wb1mmx&ep=v1_gifs_related&rid=giphy.webp&ct=g" width="400"/>
       </a>
</div>

## ________________________________________________
 
## General Information

Wireshark is a network traffic analyzer, or "sniffer," for Windows, Linux, macOS, *BSD, and other Unix-like operating systems. It uses Qt, a graphical user interface library, and libpcap and npcap as packet capture and filtering libraries.

The Wireshark distribution also comes with TShark, a line-oriented sniffer (similar to Sun's snoop or tcpdump) that uses the same dissection, capture-file reading and writing, and packet filtering code as Wireshark. Additionally, it includes **editcap**, which is a program to read capture files and write the packets from that capture file, possibly in a different capture file format, and with some packets possibly removed from the capture.

The official home of Wireshark is [Wireshark Official Website](https://www.wireshark.org).

The latest distribution can be found at [Wireshark Downloads](https://www.wireshark.org/download).

---

## Installation

Wireshark is regularly built and tested on the following platforms:

  - **Microsoft Windows**
  - **Linux (Ubuntu)**
  - **macOS / OS X**

Official installation packages are available for **Windows** and **macOS**.

It is available as either a standard or add-on package for many popular Linux distributions, including Debian, Ubuntu, Fedora, CentOS, RHEL, Arch, Gentoo, openSUSE, FreeBSD, DragonFly BSD, NetBSD, and OpenBSD.

Additionally, it is available through many third-party packaging systems such as **Homebrew** for macOS and **pkgsrc** for BSD-based systems.

To install Wireshark on **Windows**, follow the instructions below:

1. Download the **Wireshark Installer** for Windows from the official website.
2. Run the installer and follow the on-screen instructions.
3. During installation, you may need to choose to install **Npcap** (used for packet capture) if it is not already installed on your system.

### Dependencies for Building Wireshark on Windows

- **Python 3**: Required for building Wireshark.
- **AsciiDoctor**: Needed for building the documentation, including the man pages.
- **Perl and flex**: Required for generating some of the source code.

Make sure these dependencies are installed before starting the build process. 

For full installation instructions, check the **INSTALL** file and the **Developer's Guide** at [Wireshark Developer's Guide](https://www.wireshark.org/docs/wsdg_html_chunked/).

---

## Usage

To capture packets from the network on Windows, you need to ensure the following:

- **Wireshark** and **TShark** should be run with administrator privileges for capturing live network data.
- For packet capture, you need to make sure **Npcap** is correctly installed and functioning.

To run Wireshark or TShark:

1. Open **Wireshark** from the Start Menu (or launch **TShark** from the Command Prompt).
2. Select the network interface from which to capture packets.
3. Begin packet capture to analyze network traffic.

You can also use **dumpcap**, a simplified capture tool for use with specific user permissions.

---

## Multiple File Types

Wireshark can read packets from a variety of different file types, and it can transparently read compressed versions of those files. Currently supported compression formats are:

- **GZIP**
- **LZ4**
- **ZSTD**

Wireshark can read compressed files with no additional setup if the required compression libraries were available when Wireshark was compiled.

If you want to turn off support for specific formats, you can disable them at compile time by passing the appropriate options to the CMake build.

---

## SNMP

Wireshark can perform basic decoding of SNMP packets. You can also use the **libsmi** library for more sophisticated SNMP packet decoding, reading MIB files to display OIDs and variable binding values.

---

## How to Report a Bug

If you encounter a bug, please report it on the [Wireshark GitLab Issues Page](https://gitlab.com/wireshark/wireshark/-/issues).

When reporting a bug:

1. Provide the full build information from the "About Wireshark" section or the output of `wireshark -v` for Wireshark bugs.
2. Include the command used to invoke Wireshark or TShark.
3. If the bug is related to a specific trace file, attach the file (ensuring it does not contain sensitive data).

If Wireshark crashes with errors like "segmentation violation" or "bus error," you can help developers by providing a **stack trace** using a debugger like **gdb**.

---

## License

Wireshark is distributed under the **GNU GPLv2** license. Please refer to the `COPYING` file for the full text of the license.

Wireshark allows users to modify and distribute the source code, but redistribution must comply with the terms of the GPLv2.

Certain utilities distributed with the Wireshark source code are licensed under different licenses compatible with GPLv2. For example, the **pidl utility** (tools/pidl) is licensed under **GPLv3+**.

---

## Disclaimer

There is no warranty, expressed or implied, associated with this product. Use at your own risk.

For further details, please consult the **README** and the Wireshark Documentation available at [Wireshark Documentation](https://www.wireshark.org/docs/).

---

If you need additional assistance or have specific issues, please reach out to the Wireshark team at:

- **Gerald Combs** <gerald@wireshark.org>
- **Gilbert Ramirez** <gram@alumni.rice.edu>
- **Guy Harris** <gharris@sonic.net> 

---  
