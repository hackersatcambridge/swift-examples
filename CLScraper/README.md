# CL Scraper
This program looks at the public directory at http://www.cl.cam.ac.uk/people/
and parses this as structured information about the Computer Lab staff. 

# Usage
To use this program, clone it to your machine. We use Kanna to parse HTML, make sure you have followed the Kanna [installation instructions](https://github.com/tid-kijyun/Kanna#swift-package-manager).
Once you have installed Kanna, run `swift build`. Swift will tell you where it has build the program. You can then run the built executable:

```
$ swift build
Compile Swift Module 'Kanna' (5 sources)
Compile Swift Module 'CLScraper' (2 sources)
Linking ./.build/debug/CLScraper

$ ./.build/debug/CLScraper
▿ 389 elements
  ▿ CLScraper.CLMember
    ...
```