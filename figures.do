version 18

*** Figure 1

* Control-arm Kaplan-Meier
local h0 .1
local h1 .5
local n0 250
local n1 250
local n  = `n0'+`n1'
local a0 = `n0'/`n'
local a1 = `n1'/`n'
* Produce expected numbers at risk (rounded) to tabulate under each Kaplan–Meier
* Uses a trick of inserting linebreaks in value labels and these feed through to xlabels,
* creating an aligned table.
#delimit ;
local xlabs
     0 `" "0" " " "{bf:At risk}                       " "X=0: `n0'          " "X=1: `n1'          " "Marginal: `n'                   "'
     5 `" "5" " " " " "`=round(`n0'*exp(-`h0'*5))'"  "`=round(`n1'*exp(-`h1'*5))'"  "`=round(`n0'*exp(-`h0'*5)) +round(`n1'*exp(-`h1'*5))'" "'
    10 `" "10" "Time since diagnosis" " " "`=round(`n0'*exp(-`h0'*10))'" "`=round(`n1'*exp(-`h1'*10))'" "`=round(`n0'*exp(-`h0'*10))+round(`n1'*exp(-`h1'*10))'" "'
    15 `" "15" " " " " "`=round(`n0'*exp(-`h0'*15))'" "`=round(`n1'*exp(-`h1'*15))'" "`=round(`n0'*exp(-`h0'*15))+round(`n1'*exp(-`h1'*15))'" "'
    20 `" "20" " " " " "`=round(`n0'*exp(-`h0'*20))'" "`=round(`n1'*exp(-`h1'*20))'" "`=round(`n0'*exp(-`h0'*20))+round(`n1'*exp(-`h1'*20))'" "'
;
twoway 
    (function `a1'*exp(-`h1'*x) + `a0'*exp(-`h0'*x)
        , lc("63 58 114"*.6) lp(l) lw(thick) range(0 20))
    (function exp(-`h1'*x), lc("46 80 129") lp(l) lw(medthick) range(0 20))
    (function exp(-`h0'*x), lc("69 35 97") lp(-) lw(medthick) range(0 20))
    ,
    text(.8 5 "X=0" .25 6 "Marginal" .16 2 "X=1")
    legend(off)
    xlab(`xlabs')
    ylab(0(.2)1 , format(%3.1f))
    title("a) Control arm", size(medsmall) pos(11)) ytit(" " "Survivor function, S(t)")
    xtit("")
    fysize(57)
    name(ctrls , replace)
    ;
#delimit cr

* Control-arm hazards
#delimit ;
twoway 
    (function (`h0'*`a0'*exp(-`h0'*x) + `h1'*`a1'*exp(-`h1'*x)) / (`a0'*exp(-`h0'*x) + `a1'*exp(-`h1'*x))
        , lc("63 58 114"*.6) lp(l) lw(thick) range(0 20))
    (function `h1', lc("46 80 129") lp(l) lw(medthick) range(0 20))
    (function `h0', lc("69 35 97") lp(-) lw(medthick) range(0 20))
    ,
    text(.55 5 "X=1" .23 6 "Marginal" .05 5 "X=0")
    legend(off)
    xlab(0(5)20) ylab(0(.1).6 , format(%3.1f))
    title("c) Control arm", size(medsmall) pos(11)) ytit(" " "Hazard function, h(t)") xtit("Time since diagnosis")
    fysize(43)
    name(ctrlh , replace)
    ;
#delimit cr


* Research-arm Kaplan-Meier
local h0 .05
local h1 .25
local n0 250
local n1 250
local n  = `n0'+`n1'
local a0 = `n0'/`n'
local a1 = `n1'/`n'
#delimit ;
local xlabs
     0 `" "0" " " "{bf:At risk}                       " "X=0: `n0'          " "X=1: `n1'          " "Marginal: `n'                   "'
     5 `" "5" " " " " "`=round(`n0'*exp(-`h0'*5))'"  "`=round(`n1'*exp(-`h1'*5))'"  "`=round(`n0'*exp(-`h0'*5)) +round(`n1'*exp(-`h1'*5))'" "'
    10 `" "10" "Time since diagnosis" " " "`=round(`n0'*exp(-`h0'*10))'" "`=round(`n1'*exp(-`h1'*10))'" "`=round(`n0'*exp(-`h0'*10))+round(`n1'*exp(-`h1'*10))'" "'
    15 `" "15" " " " " "`=round(`n0'*exp(-`h0'*15))'" "`=round(`n1'*exp(-`h1'*15))'" "`=round(`n0'*exp(-`h0'*15))+round(`n1'*exp(-`h1'*15))'" "'
    20 `" "20" " " " " "`=round(`n0'*exp(-`h0'*20))'" "`=round(`n1'*exp(-`h1'*20))'" "`=round(`n0'*exp(-`h0'*20))+round(`n1'*exp(-`h1'*20))'" "'
;twoway 
    (function `a1'*exp(-`h1'*x) + `a0'*exp(-`h0'*x)
        , lc("0 159 153"*.6) lp(l) lw(thick) range(0 20))
    (function exp(-`h1'*x), lc("0 176 149") lp(l) lw(medthick) range(0 20))
    (function exp(-`h0'*x), lc("0 141 154") lp(-) lw(medthick) range(0 20))
    ,
    text(.8 8 "X=0" .4 7 "Marginal" .2 4 "X=1")
    legend(off)
    xlab(`xlabs') ylab(0(.2)1 , format(%3.1f))
    title("b) Research arm", size(medsmall) pos(11)) ytit(" " "Survivor function, S(t)") xtit("")
    fysize(57)
    name(trts , replace)
    ;
#delimit cr

* Research-arm hazards
#delimit ;
twoway 
    (function (`h0'*`a0'*exp(-`h0'*x) + `h1'*`a1'*exp(-`h1'*x)) / (`a0'*exp(-`h0'*x) + `a1'*exp(-`h1'*x))
        , lc("0 159 153"*.6) lp(l) lw(thick) range(0 20))
    (function `h1', lc("0 176 149") lp(l) lw(medthick) range(0 20))
    (function `h0', lc("0 141 154") lp(-) lw(medthick) range(0 20))
    ,
    text(.32 6.7 "X=1" .15 8 "Marginal" .02 6.7 "X=0")
    legend(off)
    xlab(0(5)20) ylab(0(.1).6 , format(%3.1f))
    title("d) Research arm", size(medsmall) pos(11)) ytit(" " "Hazard function, h(t)") xtit("Time since diagnosis")
    fysize(43)
    name(trth , replace)
    ;
#delimit cr

graph combine ctrls trts ctrlh trth , xcommon cols(2) xsize(6) name(fig1, replace)
graph export fig1.pdf, as(pdf) name(fig1) replace



*** Figure 2
* Plot h(t) over time
#delimit ;
twoway
    (function (.1*.5*exp(-.1*x) + .5*.5*exp(-.5*x)) / (.5*exp(-.1*x) + .5*exp(-.5*x))
        , lc("63 58 114"*.6) lp(l) lw(vthick) range(0 20))
    (function (.05*.5*exp(-.05*x) + .25*.5*exp(-.25*x)) / (.5*exp(-.05*x) + .5*exp(-.25*x))
        , lc("0 159 153"*.6) lp(l) lw(vthick) range(0 20))
    ,
    text(.18 7 "Control" .08 4 "Research")
    legend(off)
    xlab(0(5)20) xtit("Time since diagnosis")
    ylab(0(.1).4 , format(%3.1f))
    title("A) Hazards marginal to X", size(medium) pos(11)) ytit("Hazard function, h(t)")
    fysize(60)
    name(hazards, replace)
    ;
#delimit cr
* Ratio of h(t) over time
#delimit ;
twoway
    (function
        ((.05*.5*exp(-.05*x) + .25*.5*exp(-.25*x)) / (.5*exp(-.05*x) + .5*exp(-.25*x)))
        / ((.1*.5*exp(-.1*x) + .5*.5*exp(-.5*x)) / (.5*exp(-.1*x) + .5*exp(-.5*x)))
        , lc("71 203 125"*.6) lp(l) lw(vthick) range(0 20))
    ,
    legend(off)
    xlab(0(5)20) xtit("Time since diagnosis")
    ytit("Hazard ratio, h(t)") yla(.5 .75 1) yline(1)
    title("B) Ratio", size(medium) pos(11))
    fysize(40)
    name(hratio, replace)
    ;
#delimit cr

graph combine hazards hratio , iscale(*1.25) xcommon cols(1) xsize(4) name(fig2, replace)
graph export fig2.pdf, as(pdf) name(fig2) replace
