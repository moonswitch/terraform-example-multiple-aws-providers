Terraform Multiple Providers Example
=====================================

This repo shows how to use multiple providers with dynamic credentials. All providers use dynamic credentials supplied by Terraform Cloud. The providers are passed through to submodules as needed.

Many of the tricks used here are derrived from [this Stack Overflow answer](https://stackoverflow.com/a/77203439).


*Note:* This creates a bunch of Route53 hosted zones which are global resources and don't need the multi-region setup demonstrated here. I didn't think about that when I wrote the configuration and have simplified this in the real repo. This one is just for reference so I don't have to figure all of this out again when I _actually_ need it. :) 