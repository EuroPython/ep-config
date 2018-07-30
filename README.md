ep-config
=========

Configuration of the EuroPython website(s).

TODO: add introduction, and a brief description

How to run this Ansible playbook
--------------------------------

Install Ansible and other dependencies with:

```bash
pip install -r requirements.txt
```


Testing
-------

There is a Vagrant machine called `vepcon`. This is used to deploy in a safe test environment.
Launch it with:

```bash
vagrant up
```

It will run the Ansible playbook for the `vepcon` host.
