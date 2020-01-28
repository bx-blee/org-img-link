<div class="org-center">
`org-img-link`
</div>

Extensions To Emacs org-mode to allow for associating any destination link with an image (local or remote)


# Table of Contents

1.  [org-img-link  allows for associating any link to an image.](#orgcadd968)
    1.  [img-link Syntax](#org291a464)
    2.  [Installation](#org637c45e)
    3.  [Usage](#orgd36ec50)
    4.  [Origin And Status](#org572e7a0)
    5.  [Known problems:](#org917dafe)
    6.  [Evolution Plans:](#orge4e5d4a)


<a id="orgcadd968"></a>

# org-img-link  allows for associating any link to an image.

The obvious natural way to do this with org links would have been:

[ [ link-destination ] [ link-description ] ]

And when link description had been a file specification or a url
pointing to an image, the description would have become the image
that you would click to get to link-destination.

But even with the latest org-mode (org-mode 9.1), this does not work for me.


<a id="org291a464"></a>

## img-link Syntax

As a work around, we are creating a new org-link-type called:
"img-link". 
We would then use it like this:
[ [ img-link: img-path ] [ link-destination ] ] 
An example would then be:

[http://www.by-star.net](file:/bisos//blee/env/images/signup.jpg)

[http://www.by-star.net](https://d1ra4hr810e003.cloudfront.net/media/27FB7F0C-9885-42A6-9E0C19C35242B5AC/0/D968A2D0-35B8-41C6-A94A0C5C5FCA0725/F0E9E3EC-8F99-4ED8-A40DADEAF7A011A5/dbe669e9-40be-51c9-a9a0-001b0e022be7/thul-IMG_2100.jpg)


<a id="org637c45e"></a>

## Installation

You can initialize this package as:
   (require 'org-img-link)
   (xtn:org-add-link-type:img-link/activate)


<a id="orgd36ec50"></a>

## Usage

You can then use it by:
      (img-link-overlays)          &#x2013; to activate it and 
      (img-link-clear-overlays)    &#x2013; to go back to seeing it as text.


<a id="org572e7a0"></a>

## Origin And Status

Much of this code has been lifted from John Kitchn.

And at this time, it is just a stop gap measure.  Such capability is
so very essential that it should be incorporated into the org-mode
proper. We hope that the equivalent code be incorporated in org-mode
distribution.


<a id="org917dafe"></a>

## Known problems:


### The syntax is backwards, instead of:

[ [ link-destination ] [ link-description-img ] ]

we have 

[ [ img-link link-description-img ] [ link-destination ] ]


### Hovering over the image of the link we get the link-description-img

and not the link-destination.


### The display is controlled by

(img-link-overlays) and (img-link-clear-overlays)
instead of the native 
(org-toggle-inline-images) and (org-display-inline-images t)


### A bad img-link throws and error and stops other good img-links to be displayed.


<a id="orge4e5d4a"></a>

## Evolution Plans:


### TODO The backwardsness can easily be fixed

in xtn:org-add-link-type:img-link :path/proc
but img-link-overlays may be harder to fix. 
Need to see if xtn:org:link:description/get-at-point
can be used there.


### TODO There should be a way to avoid img-link-overlays and

have (org-toggle-inline-images) do the job. 
Need to run this by the org-mode mailing list.


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

