

# org-img-link:

Extensions to Emacs org-mode to allow for associating any destination link with a local or remote image.


# Table of Contents

1.  [org-img-link:](#orge7c24e1)
2.  [The Problem &#x2013; Image Links Don't Work As Described](#org5161146)
3.  [org-img-link  allows for associating any link to an image.](#orgadb1f21)
4.  [img-link Syntax](#org5defb31)
5.  [Installation](#orgfa7674e)
6.  [Usage](#org876dfe6)
7.  [Examples](#org32ed6b6)
8.  [Origin And Status](#org1a2b90a)
9.  [Known problems:](#org1486ab1)
10. [Evolution Plans:](#orgbe304fe)
11. [Maintenance And Support](#org984d558)


# The Problem &#x2013; Image Links Don't Work As Described

According To:

<https://github.com/fniessen/refcard-org-mode/blob/master/README.org>

*Image links*

To get image links, put a link to a file in the description.

Clicking on the image

    [[http://orgmode.org/][file:images/org-mode-unicorn.png]]

leads to the Org mode home page.

But that syntax DOES NOT WORK for me &#x2013; in org-version = 9.1.9 emacs 27.0.5 and emacs 26.2.


# org-img-link  allows for associating any link to an image.

The obvious natural way to do this with org links would have been:

[ [ link-destination ] [ link-description ] ]

And when link description had been a file specification or a url
pointing to an image, the description would have become the image
that you would click to get to link-destination.


# img-link Syntax

As a work around, we are creating a new org-link-type called:
"img-link". 
We would then use it like this:

    [[img-link:img-path][link-destination]] 

An example would then be:

    [[img-link:file:/bisos//blee/env/images/signup.jpg][http://www.by-star.net]]
    
    [[img-link:https://d1ra4hr810e003.cloudfront.net/media/27FB7F0C-9885-42A6-9E0C19C35242B5AC/0/D968A2D0-35B8-41C6-A94A0C5C5FCA0725/F0E9E3EC-8F99-4ED8-A40DADEAF7A011A5/dbe669e9-40be-51c9-a9a0-001b0e022be7/thul-IMG_2100.jpg][http://www.by-star.net]]

Notice that this link syntax is backwards with respect to the usual org-mode link syntax.
This is due to implementation convenience.


# Installation

You can initialize this package as:

    (require 'org-img-link)
    (xtn:org-add-link-type:img-link/activate)


# Usage

You can then use it by:

    (img-link-overlays)          ;; to activate it and 
    (img-link-clear-overlays)    ;; to go back to seeing it as text.


# Examples

See <./org-img-link-example.md> for a set of examples.


# Origin And Status

Much of this code has been lifted from John Kitchn.

And at this time, it is just a stop gap measure.  Such capability is
so very essential that it should be incorporated into the org-mode
proper. We hope that the equivalent code be incorporated in org-mode
distribution.


# Known problems:


### The syntax is backwards, instead of:

    [[link-destination][link-description-img]]

we have 

    [[img-link:link-description-img][link-destination]]


### Hovering over the image of the link we get the link-description-img

and not the link-destination.


### The display is controlled by

    (img-link-overlays) and (img-link-clear-overlays)
    instead of the native 
    (org-toggle-inline-images) and (org-display-inline-images t)


### A bad img-link throws and error and stops other good img-links to be displayed.


# Evolution Plans:


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

    <a href="https://www.w3schools.com"> <img
    border="0" alt="W3Schools" src="logo_w3s.gif" width="100"
    height="100"> </a>

The link context that we are speaking of is that of the native
org-link and is unrelated to org-exporting.


# Maintenance And Support

Mohsen BANAN &#x2013; <http://mohsen.1.banan.byname.net/contact>

