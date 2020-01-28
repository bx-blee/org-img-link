
# Table of Contents

1.  [org-img-link  allows for associating any link to an image.](#org917f026)
    1.  [img-link Syntax](#orgdca7a13)
    2.  [Installation](#org0c67773)
    3.  [Usage](#org6b481c5)
    4.  [Origin And Status](#orge841452)
    5.  [Known problems:](#org4ab34a7)
        1.  [The syntax is backwards, instead of:](#org096496e)
        2.  [Hovering over the image of the link we get the link-description-img](#org5a68fb2)
        3.  [The display is controlled by](#orgd9f7229)
        4.  [A bad img-link throws and error and stops other good img-links to be displayed.](#orgae98cc0)
    6.  [Evolution Plans:](#orga0eac47)
        1.  [The backwardsness can easily be fixed](#orgd8e3a9e)
        2.  [There should be a way to avoid img-link-overlays and](#orgfce646b)
        3.  [All of this points to the fact that the org-mode](#orgef3b40b)



<a id="org917f026"></a>

# org-img-link  allows for associating any link to an image.

The obvious natural way to do this with org links would have been:

[ [ link-destination ] [ link-description ] ]

And when link description had been a file specification or a url
pointing to an image, the description would have become the image
that you would click to get to link-destination.

But even with the latest org-mode (org-mode 9.1), this does not work for me.


<a id="orgdca7a13"></a>

## img-link Syntax

As a work around, we are creating a new org-link-type called:
"img-link". 
We would then use it like this:
[ [ img-link: img-path ] [ link-destination ] ] 
An example would then be:

[http://www.by-star.net](file:/bisos//blee/env/images/signup.jpg)

[http://www.by-star.net](https://d1ra4hr810e003.cloudfront.net/media/27FB7F0C-9885-42A6-9E0C19C35242B5AC/0/D968A2D0-35B8-41C6-A94A0C5C5FCA0725/F0E9E3EC-8F99-4ED8-A40DADEAF7A011A5/dbe669e9-40be-51c9-a9a0-001b0e022be7/thul-IMG_2100.jpg)


<a id="org0c67773"></a>

## Installation

You can initialize this package as:
   (require 'org-img-link)
   (xtn:org-add-link-type:img-link/activate)


<a id="org6b481c5"></a>

## Usage

You can then use it by:
      (img-link-overlays)          &#x2013; to activate it and 
      (img-link-clear-overlays)    &#x2013; to go back to seeing it as text.


<a id="orge841452"></a>

## Origin And Status

Much of this code has been lifted from John Kitchn.

And at this time, it is just a stop gap measure.  Such capability is
so very essential that it should be incorporated into the org-mode
proper. We hope that the equivalent code be incorporated in org-mode
distribution.


<a id="org4ab34a7"></a>

## Known problems:


<a id="org096496e"></a>

### The syntax is backwards, instead of:

[ [ link-destination ] [ link-description-img ] ]

we have 

[ [ img-link link-description-img ] [ link-destination ] ]


<a id="org5a68fb2"></a>

### Hovering over the image of the link we get the link-description-img

and not the link-destination.


<a id="orgd9f7229"></a>

### The display is controlled by

(img-link-overlays) and (img-link-clear-overlays)
instead of the native 
(org-toggle-inline-images) and (org-display-inline-images t)


<a id="orgae98cc0"></a>

### A bad img-link throws and error and stops other good img-links to be displayed.


<a id="orga0eac47"></a>

## Evolution Plans:


<a id="orgd8e3a9e"></a>

### TODO The backwardsness can easily be fixed

in xtn:org-add-link-type:img-link :path/proc
but img-link-overlays may be harder to fix. 
Need to see if xtn:org:link:description/get-at-point
can be used there.


<a id="orgfce646b"></a>

### TODO There should be a way to avoid img-link-overlays and

have (org-toggle-inline-images) do the job. 
Need to run this by the org-mode mailing list.


<a id="orgef3b40b"></a>

### TODO All of this points to the fact that the org-mode

link syntax is incomplete. We should evolve org-mode to be on top
of "Emacs Mark-Up Language" (EML) &#x2013; a parallel to html5 &#x2013; in
which a link syntax would be at least as rich of html.  html link
syntax sees img as an integral part of the syntax.  For example An
image as a link is something like:
<a href="<https://www.w3schools.com>"> <img
border="0" alt="W3Schools" src="logo<sub>w3s.gif</sub>" width="100"
height="100"> </a>

The link context that we are speaking of is that of the native
org-link and is unrelated to org-exporting.

