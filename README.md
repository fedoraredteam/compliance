# Fedora Red Team Compliance Project

## Motivation

Security compliance is, for some users, unavoidable. Legal regulatory requirements like [FISMA](https://en.wikipedia.org/wiki/Federal_Information_Security_Management_Act_of_2002), which mandate the use of risk management frameworks like [NIST RMF](https://en.wikipedia.org/wiki/Risk_management_framework) or DoDRMF, can add non-trivial cost and risk to any project.

The impact of compliance on a system's overall security posture is positive and non-zero. However, for compliance-encumbered projects, simply complying with regulatory requirements should be considered necessary-but-insufficient from an infosec perspective.

Further, the infosec community as a whole could benefit from a more effective feedback loop between security compliance (passive) and offensive security practices like penetration testing (active).

In this light, the [Fedora Red Team SIG](http://fedoraproject.org/wiki/SIGs/Red_Team) will be helping to document and automate compliance tasks in order to:

* **Reduce** the time and risk burden to projects by automating compliance with tools like [Ansible](https://www.ansible.com/)
* **Accelerate** the A&A process by providing template bodies of evidence (BoE) for open source projects
* **Pentest** security-compliant configurations to help actively identify gaps and provide constructive feedback to regulators
* **Build community** with infosec practitioners and encourage them to take a more active role in making security compliance more relevant and effective

The working name for this project is **RTC** for now, short for Red Team Compliance.

## Early goals

As a starting-point, RTC will be updating and enhancing the [OpenShift Compliance Guide](http://openshift-compliance-guide.readthedocs.io/en/latest/), which is an open source template body of evidence for OpenShift A&As.

In order to make this project more useful to the community, RTC will attempt to decompose the OpenShift Compliance Guide into reusable components, and to generalize the material so it's reusable with other projects, like [OpenStack](https://www.openstack.org/).

RTC is a community project, and will be open to supporting security compliance for any open source technology. However, since the initial contributors are most familiar with the Red Hat ecosystem, we'll be starting with projects like [OpenShift](https://www.openshift.org/), [RDO](https://www.rdoproject.org/), and [ManageIQ](http://manageiq.org/).

## Contribute

We're actively working this project, so please join the conversation!

* Help us plan on our [project page](https://github.com/fedoraredteam/compliance/projects/1)
* #fedora-security on [Freenode IRC](https://webchat.freenode.net/)
* [security@lists.fedoraproject.org](mailto:security@lists.fedoraproject.org)
* [jasoncallaway@fedoraproject.org](mailto:jasoncallaway@fedoraproject.org)
* Hit us up with an impactful PR and earn yourself some [Fedora Project](https://fedoraproject.org/wiki/Fedora_Project_Wiki) swag!
