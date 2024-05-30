---
date: 2023-08-30T00:00:00Z
draft: true
lang: en
tags: [ TODO_TAGS ]
title: TODO_TITLE
type: link # image quote video text audio chat
via: "[Who](http://example.com)"
---


2023-08-29 dotfiles-bare-git

 
## The main concept by hand

[https://www.atlassian.com/git/tutorials/dotfiles](https://www.atlassian.com/git/tutorials/dotfiles)

https://www.chezmoi.io/comparison-table/

* What is it and why is it interesting

## Porcelain tool: `vcsh` and `vcsh-dotfiles`
* Add https://github.com/goblindegook/dotfiles/ as inspiration / “via”?

[https://germano.dev/dotfiles/](https://germano.dev/dotfiles/)

https://germano.dev/dotfiles/

* Same, clip stuff from here about the vcsh tool

[https://github.com/ek9/vcsh-dotfiles](https://github.com/ek9/vcsh-dotfiles)

https://github.com/ek9/vcsh-dotfiles

> vcsh-dotfiles aims to simplify the bootstrap procedure of managing your dotfiles with vcsh. It sets up vcsh, mr, adds usable hooks and lays down simple directory that vcsh repositories can follow.

## Porcelain tool: `yadm`

[https://yadm.io/](https://yadm.io/)

https://yadm.io/

* Clip a useful summary

—//—

See also, a comparison table of these tools (and others)

[https://chezmoi.io/comparison-table/](https://chezmoi.io/comparison-table/)

https://chezmoi.io/comparison-table/

—//—

2023-09-08

via ChatGPT 3.5

> vcsh and YADM are both tools designed for managing dotfiles, but they have different philosophies and approaches. Here’s a comparison of their main differences and distinguishing features:

**YADM (Yet Another Dotfiles Manager):**

	1.	**High-Level Abstraction:** YADM provides a high-level abstraction for managing dotfiles. It abstracts away many of the complexities of Git, making it easy for users who are less familiar with Git.
	2.	Single Git Repository: YADM uses a single Git repository to manage all dotfiles, making it straightforward to track and manage your configuration files.
	3.	**System-Specific Overrides:** YADM allows you to have system-specific overrides for dotfiles, so you can customize configurations for different systems or hosts.
	4.	**Encryption Support:** YADM provides built-in support for encrypting sensitive files in your dotfiles repository.
	5.	**Bootstraping:** YADM includes a yadm bootstrap command that helps set up your dotfiles on a new system quickly.
	6.	**Script Integration:** YADM supports integration with post-bootstrap scripts, enabling you to perform additional actions during setup.

**vcsh:**

	1.	**Multiple Git Repositories:** vcsh takes a different approach by using multiple Git repositories, one for each set of dotfiles (e.g., dotfiles, zsh, git, etc.). This allows for more granular control and organization of dotfiles.
	2.	**Minimal Abstraction:** vcsh is less abstract than YADM when it comes to Git operations. It exposes the full power of Git, which can be advantageous for users who are comfortable with Git and need fine-grained control.
	3.	**Simplicity and Modularity:** vcsh is designed to be lightweight and modular. You can create and manage repositories for specific applications or sets of configuration files.
	4.	**No System-Specific Overrides:** vcsh doesn’t have built-in support for system-specific overrides. Configuration customization typically happens at the Git repository level.
	5.	**Encryption Support:** Similar to YADM, you can use external tools to encrypt sensitive files in your vcsh-managed repositories.
	6.	**Flexible Setup:** Setting up vcsh on new systems may require more manual steps compared to YADM. You need to clone the relevant repositories individually.

In summary, the choice between YADM and vcsh depends on your preferences and requirements. YADM offers a simpler, higher-level approach with more built-in features, making it suitable for users who want a quick and easy way to manage dotfiles. On the other hand, vcsh provides a more flexible and modular approach for users who prefer to have fine-grained control over their dotfile repositories and are comfortable with Git.
