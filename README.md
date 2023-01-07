<div id="top"></div>

<!-- PROJECT SHIELDS -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links-->
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url]

> **Note** This project will not be maintained anymore simply because I have lost interest in it anymore.

# POMODORO-CLI


<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li>
      <a href="#usage">Usage</a>
      <ul>
        <li><a href="#examples">Examples</a></li>
      </ul>
    </li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
    <li><a href="#miscelleneous">Miscelleneous</a></li>
  </ol>
</details>

<!-- ABOUT THE PROJECT -->
## About The Project

pomodoro-cli is the simplest possible pomodoro timer.

- Linux
![image](https://user-images.githubusercontent.com/23709916/146772035-9ee0885f-9102-4d96-bc76-6d141e3702c9.png)
- macOS
![image](https://user-images.githubusercontent.com/86282911/194737349-f2b4f840-0371-4090-b348-6ed531a6b97f.png)

**pomodoro-cli will notify you when it's time for a break, or time to focus.**

<p align="right">(<a href="#top">back to top</a>)</p>

## Getting Started

### Prerequisite
- `Zenity`

### Installation

```bash
git clone https://github.com/proffapt/pomodoro-cli
chmod +x install.sh
./install.sh
```

<p align="right">(<a href="#top">back to top</a>)</p>

## Usage

````

Usage: pd [options] focus break long_break breaks_until_long
options -h: display help message
focus Minutes of focus until break | Default = 25
break Minutes of break until focus | Default = 5
long_break Minutes of long break until focus | Default = 15
breaks_until_long Number of breaks until long break | Default = 4
apps_to_kill Apps to kill during focus time | Default = none

````

### Examples
* Start a pomodoro timer with 20 minutes of focus time
    ```bash
    pd 20
    ```
* 20 minutes of focus time and 3 minutes of break time
    ```bash
    pd 20 3
    ```
* 20 minutes of focus time, 3 minutes of break time and 10 minutes of long break
    ```bash
    pd 20 3 10
    ```
* 20 minutes of focus time, 3 minutes of break time, 10 minutes of long break and 4 cicles of focus until long break
    ```bash
    pd 20 3 10 4
    ```
* 20 minutes of focus time, 3 minutes of break time, 10 minutes of long break and 4 cycles of focus until long break. Disable Minecraft and Cheese during focus time. You need to enter the name of the apps you would use to start it through the terminal.(separated by commas)
    ```bash
    pd 20 3 10 4 minecraft,cheese
    ```

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- CONTACT -->
## Contact

<p>
📫 Arpit Bhardwaj ( aka proffapt ) -   

<a href="https://twitter.com/proffapt">
  <img align="center" alt="proffapt's Twitter " width="22px" src="https://raw.githubusercontent.com/edent/SuperTinyIcons/master/images/svg/twitter.svg" />
</a>
<a href="https://t.me/proffapt">
  <img align="center" alt="proffapt's Telegram" width="22px" src="https://raw.githubusercontent.com/edent/SuperTinyIcons/master/images/svg/telegram.svg" />
</a>
<a href="https://www.linkedin.com/in/proffapt/">
  <img align="center" alt="proffapt's LinkedIn" width="22px" src="https://raw.githubusercontent.com/edent/SuperTinyIcons/master/images/svg/linkedin.svg" />
</a> 
<a href="mailto:proffapt@pm.me">
  <img align="center" alt="proffapt's mail" width="22px" src="https://raw.githubusercontent.com/edent/SuperTinyIcons/master/images/svg/mail.svg" />
</a> 
<a href="https://cybernity.group">
  <img align="center" alt="proffapt's forum for cybernity" width="22px" src="https://cybernity.group/uploads/default/original/1X/a8338f86bbbedd39701c85d5f32cf3d817c04c27.png" />
</a> 
</p>

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

* [Choose an Open Source License](https://choosealicense.com)
* [Img Shields](https://shields.io)

<p align="right">(<a href="#top">back to top</a>)</p>

## Miscelleneous

Do consider looking at other paradigms of this documentation
  - [Change-logs](CHANGELOG.md)
  - [License used](LICENSE.txt)
  - [Code Of Conduct](CODE_OF_CONDUCT.md)
  - [How to contribute?](CONTRIBUTING.md)

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- MARKDOWN LINKS & IMAGES -->

[contributors-shield]: https://img.shields.io/github/contributors/proffapt/code-runner.svg?style=for-the-badge
[contributors-url]: https://github.com/proffapt/code-runner/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/proffapt/code-runner.svg?style=for-the-badge
[forks-url]: https://github.com/proffapt/code-runner/network/members
[stars-shield]: https://img.shields.io/github/stars/proffapt/code-runner.svg?style=for-the-badge
[stars-url]: https://github.com/proffapt/code-runner/stargazers
[issues-shield]: https://img.shields.io/github/issues/proffapt/code-runner.svg?style=for-the-badge
[issues-url]: https://github.com/proffapt/code-runner/issues
[license-shield]: https://img.shields.io/github/license/proffapt/code-runner.svg?style=for-the-badge
[license-url]: https://github.com/proffapt/code-runner/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/proffapt
