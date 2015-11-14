# DebVirt
Debian-based, lightweight OS for virtualization

# Building
1. Install [blade](https://otm.github.io/blade/) and live build (`sudo apt-get install live-build`)
2. Generate the config for live-build: `blade config`
3. Bootstrap the chroot: `blade bootstrap`
4. Customise the chroot using the config generated earlier: `blade chroot`
5. Build the binary (aka the iso): `blade binary`
