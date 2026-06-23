---
permalink: /
title: ""
excerpt: ""
author_profile: true
redirect_from:
  - /about/
  - /about.html
---

<span class='anchor' id='about-me'></span>

I am a Research Scientist at the State Key Laboratory of CAD & CG, Zhejiang University. My research lies at the intersection of computer graphics, physics-based simulation, embodied AI, and high-performance computing. I develop scalable algorithms and systems for simulating complex physical phenomena, with a focus on contact-rich dynamics, deformable-body simulation, GPU-parallel computing, and learning-enhanced simulation.

Prior to joining Zhejiang University, I was a postdoctoral researcher at the University of Utah and Clemson University. I received my Ph.D. degree in Computer Science and Technology and M.S. degree in Software Engineering from Xiamen University. From 2017 to 2019, I was a visiting scholar at the University of New Mexico.

<span class='anchor' id='publications'></span>

# Publications

{% for paper in site.data.publications.featured %}
  {% include publication-card.html paper=paper %}
{% endfor %}

{% for paper in site.data.publications.simple %}
  {% include publication-simple.html paper=paper %}
{% endfor %}
