# Vagrant & Packer Builds

This repository contains automated build scripts for creating Oracle Linux 9 and 10 Vagrant boxes using Packer, along with ready-to-use Vagrant configurations for provisioning local environments.

It is intended to create consistent and reproducible Oracle Linux environments.

### 📁 **Repository Structure**

```bash
├── packer
│   ├── build
│   └── templates
│       ├── http
│       └── scripts
└── vagrant
    ├── ol10
    └── ol9
```

- **packer/** — Packer templates and provisioning scripts for building the base Vagrant boxes
- **vagrant/** — Vagrantfiles referencing the locally-built boxes

### **Requirements**

- [Packer](https://developer.hashicorp.com/packer)
- [Vagrant](https://developer.hashicorp.com/vagrant)
- [VirtualBox](https://www.virtualbox.org/) or another [supported provider](https://developer.hashicorp.com/vagrant/docs/providers)

### 🔧 **Building the Oracle Linux Boxes with Packer**

To build a box:

```bash
cd packer
./build_ol9_box.sh
```

The resulting .box file will be created in the **build/** directory and will be add as a vagrant box

### 💻 **Using the Vagrant Builds**

Navigate to the Vagrant environment:

```bash
cd vagrant/ol9

# Start the VM
vagrant up

# SSH into the VM
vagrant ssh

# To stop or destroy
vagrant halt
vagrant destroy -f
```

### ⚙️ **Customization**

The following can be customized by modifying the files under packer/templates or the respective Vagrantfile:

- VM resources (CPU, RAM)
- Networking
- Provisioning scripts (shell, Ansible, etc.)
- Packer kickstart and build options
