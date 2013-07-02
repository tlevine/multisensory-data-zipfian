<style>p.comment { display: none; }</style>
# Multisensory data experiences
<!-- For the Zipfian Academy July 2 class -->
Thomas Levine ([thomaslevine.com](http://thomaslevine.com)),

CSV Soundsystem ([csvsoundsystem.com](http://csvsoundsystem.com))

[tlevine.github.io/multisensory-data-zipfian](http://tlevine.github.io/multisensory-data-zipfian)



## Information overload
![A stack of papers](http://farm9.staticflickr.com/8434/7827785878_4a9c041ff8_o.jpg)
<p class="comment">
  Today, we produce more information than we can handle.
  To cope with this, we data scientists convert this information
  to structured data that we can make sense of in a more
  automated way.
</p>
<p class="comment">
  That helps, but now we have to deal with all of these data.
  We need new tools to help us with these data.
</p>



## Big data
[![For handle big data, solution is very simple: buy bigger monitor and use smaller font in the terminal.](borat.png)](https://twitter.com/mysqlborat/status/306078371182428161)
<p class="comment">
  In previous classes, you've learned about tools for
  storing insane quantities of data and running calculations
  on all of the data. We need more tools like that, but
  we also need new tools for exploring and presenting data.
</p>



## Data table
```
Special Operations,2005,2006,2007,2008,2009,Total
Emergency Service,0%,0%,1%,1%,0%,2%
Harbor Unit,0%,0%,0%,0%,0%,0%
Aviation Unit,0%,0%,0%,0%,0%,0%
Taxi Unit,0%,0%,0%,0%,0%,0%
Canine Unit,0%,0%,0%,0%,0%,0%
Mounted Unit,0%,0%,0%,0%,0%,0%
Headquarters,0%,0%,0%,0%,0%,0%
Special Operations Division Total,0%,0%,1%,1%,0%,2%
Percent of All Subject Officers Against Whom Allegations were Substantiated,0%,0%,0.2%,0.3%,0%,0.1%
```
<p class="comment">
  A standard data visualization tool is the data table.
  At CSV Soundsystem, we prefer CSV files.
  As MySQL borat suggests, we could just make bigger tables.
  Tables are great for finding specific values,
  but it takes a long time to spot broader trends in tables.
</p>
<p class="comment">
  This is a table of complaints against New York City police officers, I think.
  It's small enough that it fits on the screen and that
  we can get the general picture that most values are, but
  this wouldn't work for larger tables.
</p>



## Graphs
[![Plots of New York subway use surrounding mega storms](turnstile.png)](http://www.theatlanticcities.com/commute/2013/05/visualizing-impact-mega-storms-transit/5660/)
<p class="comment">
  So we make graphs.
  If you listen to Tufte, you will use graphs to present data in a
  multivariate way and to present the relationships among different variables.
</p>
<p class="comment">
  Let's talk more about multivariate systems.
  If you have a lot of variables, it's hard to think about all of them at once.
  Instead of doing that, we think of all of these variables as one concept.
  We can use statistical methods to convert many variables into one, or we can
  use data visualization methods to represent many variables at once.
</p>
<p class="comment">
  When we're analyzing a multivariate system, we can first look at the
  collective trend across all of the variables without worrying about the
  specific changes.
</p>
<p class="comment">
  This graph depicts the turns of New York subway turnstiles. This graph
  represents about four varibles: Date, year, subway stop, and number of
  turnstile entries per day. For the past three years, New York city has had
  one pretty big storm per year, each of them in the fall. The red lines
  are the dates of these storms, and the x axis is the date relative the
  storm, going from three weeks before the storm to three weeks after the storm.
  The y axis is the number of times a person entered a subway station each day,
  and each line is a different subway station. The first panel is for the 2010
  microburst, the second is for the 2011 Huricane Irene, and the third is for
  the 2012 Hurricane Sandy.
</p>
<p class="comment">
  Let's get back to our discussion of multivariate data. We are looking at
  four variables, but we are thinking about them as one concept.
</p>
<p class="comment">
  Look at these bumps that happen about five times per line.
  When I look at these, I'm not noticing the individual lines or the individual
  dates; I'm just noticing that there's some pattern.
  Now that we've found some broader pattern, let's focus on it and start
  picking apart the individual variables. Looking at the date variable, I see that
  this bump happens every seven days, so it might be the weekend. I guess people
  use the subway less on weekends. Looking at the subway station variable
  (the different lines), I notice that this bump happens across most stations.
  I also notice that some stations drop really low. That might be an error, or
  it might be that the stations or closed for maintenance. Or something else.
</p>
<p class="comment">
  Now let's look at the elephant in the room that I've been ignoring.
  We've noticed some pattern in the multivariate system; the lines are mostly
  straight, with these bumps on the weekends. But this pattern gets inturrupted
  at the red line. What's going on there? 
  Well that line is the date of the storms.
  Subway stations got shut during the storms, and that explains the drops
  in ridership.
  But when we look more closely
</p>
<p class="comment">
  You probably didn't need my narration in order to read this graph;
  I explain it like this to convey this approach of aggregating multivariate
  data. First, we looked for broader trends without focusing on specific
  variables. Then, once we identified an interesting trend, we iteratively
  focused on interesting subsets and interesting variables.
  This is related to a concept of hierarchy from graphic design; if you make
  one thing really big, people will know what to look at first, and then they
  can focus on the details if they're still interested.
  I keep this in mind when I'm producing data visualizations and
  when I'm doing data analyses in general.
</p>



## Videos
[![complicated plot](4l-FixedScale-NoMuProf2-preview.png)](4l-FixedScale-NoMuProf2.gif)



## Data sonification
[![FMS Symphony](fms-symphony-preview.png)](http://fms.csvsoundsystem.com)



## Data sonification
<!-- Ridership Rachenitsa -->
<video src="transit.webm" controls width="100%">



## Data gastronomification
[![Data guacamole](data-guacamole.jpg)](https://github.com/tlevine/data-guacamole)
[gastronomify R package](https://github.com/csv/gastronomify)



## Take-aways

* Present the multivariate world; escape Flatland.
* Data can be mapped to anything.



## More resources

* [Music videos in R](http://livestre.am/4pN67)
* [Data-driven rhythms](https://github.com/csv/ddr)
* [A blog post](http://thomaslevine.com/!/sensory-data-experiences/)
