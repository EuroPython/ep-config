ep-config
=========

Configuration of the EuroPython website(s).

TODO: add introduction, and a brief description

How to run this Ansible playbook
--------------------------------

1. Create a `vault-pass.txt` file with the provision password.
2. Install Ansible and other dependencies with:

```bash
pip install -r requirements.txt
```

3. Launch the ansible playbook

```bash
ansible-playbook playbook.yml
```

Continuous Integration / Delivery
---------------------------------

TODO: travis ?

Testing
-------

There is a Vagrant machine called `vepcon`. This is used to deploy in a safe test environment.
Launch it with:

```bash
vagrant up
```

It will run the Ansible playbook for the `vepcon` host.
