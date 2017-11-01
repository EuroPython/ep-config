ep-config
=========

Configuration of the EuroPython website(s).

TODO: add introduction, and a brief description

How to run this Ansible playbook
--------------------------------

Vagrant Manager
---------------

This project includes a Vagrantfile to create a virtual machine which you
can use to develop, test, and mainly run the Ansible playbook.
To start it, `cd` to the root of this project and run:

```
vagrant up manager
vagrant ssh manager
```

If everything went okay, you can now use Ansible to deploy:
```
cd /vagrant
ansible-playbook site.yml -i inventory/prod -l europython
```

Testing
-------

There is a Vagrant machine called `test`. This is used to deploy in a safe test environment.
Launch it with:

```
vagrant up test
```

Once it is provisioned by Vagrant, do:

```
vagrant ssh manager
cd /vagrant
ansible-playbook site.yml -i inventory -l test
```
