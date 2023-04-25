(* ::Package:: *)

(* ::Title:: *)
(*\:65cb\:5149\:7269\:8d28\:5316\:5b66\:53cd\:5e94\:53cd\:5e94\:52a8\:529b\:5b66\:7814\:7a76*)


(* ::Subtitle:: *)
(*\[LongDash]\[LongDash]\:8517\:7cd6\:8f6c\:5316\:53cd\:5e94*)


(* ::Section:: *)
(*\:6570\:636e\:5bfc\:5165\:4e0e\:521d\:59cb\:5316*)


<<draw.wl
<<file.wl
<<fitting.wl


SetDirectory[path]


path="/Users/royalty/Desktop/Experiments_for_Chemistry/physical_chemistry";
rawdata=Import[path<>"/Kecai_Xuan/exp7/data/data.xlsx"];


DateListPlot[rawdata]


name={{1->"30\:5ea6-\:4f4e\:7cd6-\:4f4e\:9178"},{2->"30\:5ea6-\:4f4e\:7cd6-\:9ad8\:9178"},{3->"30\:5ea6-\:9ad8\:7cd6-\:4f4e\:9178"},{4->"30\:5ea6-\:9ad8\:7cd6-\:9ad8\:9178"},{5->"35\:5ea6-\:4f4e\:7cd6-\:4f4e\:9178"},{6->"35\:5ea6-\:4f4e\:7cd6-\:9ad8\:9178"},{7->"35\:5ea6-\:9ad8\:7cd6-\:4f4e\:9178"},{8->"35\:5ea6-\:9ad8\:7cd6-\:9ad8\:9178"},{9->"40\:5ea6-\:4f4e\:7cd6-\:4f4e\:9178-1"},{10->"40\:5ea6-\:4f4e\:7cd6-\:4f4e\:9178-2"}};
name=name//Flatten;


absolute = Table[AbsoluteTime[rawdata[[i, 1, 1]]], {i, 1, 10}];
inf = {-0.4525,-0.4814,-0.9046,-0.9253,-0.2103,-0.4476,-0.8321,-0.8528,-0.3739,-0.3920};


data = rawdata;

For[i = 1, i <= 10, i++,
    l = Length[data[[i]]];
    For[j = 1, j <= l, j++,
        data[[i,j,1]] = AbsoluteTime[data[[i,j,1]]];
    ]
]
For[i = 1, i <= 10, i++,
    l = Length[data[[i]]];
    For[j = 1, j <= l, j++,
        data[[i,j,1]] = data[[i,j,1]] - absolute[[i]];
    ]
]



ListPlot[data[[4]]]


(* ::Section:: *)
(*\:7ebf\:6027\:62df\:5408*)


(* ::Subsection:: *)
(*\:5bf9\:6570\:4fee\:6b63*)


For[i = 1, i <= 10, i++,
    l = Length[data[[i]]];
    For[j = 1, j <= l, j++,
        data[[i,j,2]] = Log[data[[i,j,2]]-inf[[i]]];
    ]
]


Table[ListPlot[data[[i]],PlotTheme->"Detailed",PlotLabel->i/.name,FrameLabel->{"t / s","ln (\!\(\*SubscriptBox[\(\[Alpha]\), \(0\)]\)-\!\(\*SubscriptBox[\(\[Alpha]\), \(\[Infinity]\)]\))"}],{i,1,10}]


(* ::Text:: *)
(*\:53d1\:73b0\:6709\:7684\:5730\:65b9\:662f\:865a\:6570\:ff0c\:53d6\:5bf9\:6570\:53d8\:6210\:4e86\:590d\:6570*)


(* ::Subsection:: *)
(*Subscript[\[Alpha], \[Infinity]] \:7684\:6d4b\:91cf\:6709\:5f88\:5927\:8bef\:5dee\:ff0c\:5c06\:660e\:663e\:5f2f\:66f2\:7684\:6570\:636e\:70b9\:820d\:5f03\:ff0c\:518d\:8fdb\:884c\:7ebf\:6027\:62df\:5408*)


newdata=data;


newdata[[5]]=Drop[data[[5]],-46];
newdata[[6]]=Drop[data[[6]],-20];
newdata[[8]]=Drop[data[[8]],-27];
Table[ListPlot[newdata[[i]],PlotTheme->"Detailed",PlotLabel->i/.name],{i,1,10}]


linearmodel = Table[LinearModelFit[newdata[[i]], x, x],{i,1,10}];
linearmodel//Column
Table[linearmodel[[i]]["CorrelationMatrix"],{i,1,10}]//Column


(* ::Subsubsection:: *)
(*\:8ba1\:7b97\:6d3b\:5316\:80fd*)


k=-Table[linearmodel[[i]]["BestFitParameters"][[2]],{i,1,10}]
t={30,30,30,30,35,35,35,35,40,40}


activate[k_,t_,a_,b_]:=Module[
{Ea},
Ea/.Solve[Log[k[[a]]/k[[b]]]==-(Ea/R)(1/(t[[a]]+273.15)-1/(t[[b]]+273.15)),Ea]
]


e=Table[activate[k,t,i,i+4],{i,1,4}]/1000


Table[(e[[i]]-103.55)/103.55,{i,4}]


(* ::Subsubsection:: *)
(*\:7ed3\:8bba\:ff1a\:7ebf\:6027\:76f8\:5173\:7cfb\:6570\:8f83\:4f4e\:ff0c\:5e9f\:5f03\:4e0d\:7528\:ff0c\:9700\:8981\:6362\:4e3a\:975e\:7ebf\:6027\:62df\:5408*)


(* ::Subsection:: *)
(*\:6309\:7167\:7ebf\:6027\:62df\:5408\:7684\:8981\:6c42\:7ee7\:7eed\:505a*)


(* ::Subsubsection:: *)
(*\:51c6\:5907\:7ed8\:56fe*)


ModelLegends[linearmodel,t]


linearmodellegends={{"0.59104 - 0.000443858 t"},{"0.371294 - 0.00148772 t"},{"1.31047 - 0.000443837 t"},{"1.23074 - 0.00143603 t"},{"0.220067 - 0.00116957 t"},{"0.196733 - 0.00297584 t"},{"1.28491 - 0.0008912 t"},{"1.00643 - 0.00311649 t"},{"0.485241 - 0.00166394 t"},{"0.136844 - 0.00166963 t"}}


todraw=Table[linearmodel[[i]][t],{i,1,10}]


(* ::Subsubsection:: *)
(*\:5206\:522b\:7ed8\:5236*)


plotRespectively=ListPlot[#1,Frame -> True, LabelStyle
     -> Directive[Black], GridLines -> Automatic, PlotLegends -> Placed[LineLegend[
    #2, LegendFunction -> Frame], #3],FrameLabel->#4, PlotStyle -> ColorData[
    #5, "ColorList"],PlotRange->#6]&;


point1=plotRespectively[data[[1]],{"\:7ec4\:522b 1"},{0.8,0.8},{"t / s","ln (\!\(\*SubscriptBox[\(\[Alpha]\), \(0\)]\)-\!\(\*SubscriptBox[\(\[Alpha]\), \(\[Infinity]\)]\))"},3,Full];
point2=plotRespectively[data[[2]],{"\:7ec4\:522b 2"},{0.8,0.8},{"t / s","ln (\!\(\*SubscriptBox[\(\[Alpha]\), \(0\)]\)-\!\(\*SubscriptBox[\(\[Alpha]\), \(\[Infinity]\)]\))"},3,Full];

line1= Plot[todraw[[1]], {t, 0, 2500}, PlotRange
     -> Full, Frame -> True, LabelStyle -> Directive[Black], GridLines ->
     Automatic, PlotLegends -> Placed[LineLegend["xzcv", LegendFunction -> Frame
    ], {0.8,0.8}], FrameLabel -> {"t / s","ln (\!\(\*SubscriptBox[\(\[Alpha]\), \(0\)]\)-\!\(\*SubscriptBox[\(\[Alpha]\), \(\[Infinity]\)]\))"}, PlotStyle -> Directive[Thickness[0.01],ColorData[99,"ColorList"]], ImageSize -> Large];
line2= Plot[todraw[[2]], {t, 0, 2200}, PlotRange
     -> Full, Frame -> True, LabelStyle -> Directive[Black], GridLines ->
     Automatic, PlotLegends -> Placed[LineLegend["xzcv", LegendFunction -> Frame
    ], {0.8,0.8}], FrameLabel -> {"t / s","ln (\!\(\*SubscriptBox[\(\[Alpha]\), \(0\)]\)-\!\(\*SubscriptBox[\(\[Alpha]\), \(\[Infinity]\)]\))"}, PlotStyle -> Directive[Thickness[0.01],ColorData[99,"ColorList"]], ImageSize -> Large];
    
first=Show[line1,point1]
second=Show[line2,point2]


Export["/Users/royalty/Desktop/Experiments_for_Chemistry/physical_chemistry/Kecai_Xuan/exp7/first.jpg",first]
Export["/Users/royalty/Desktop/Experiments_for_Chemistry/physical_chemistry/Kecai_Xuan/exp7/second.jpg",second]


(* ::Subsubsection:: *)
(*\:7ed8\:5236\:4e8e\:4e00\:5f20\:56fe\:4e2d*)


lines=Plot[todraw, {t, 0, 2500}, PlotRange
     -> Full, Frame -> True, LabelStyle -> Directive[Black], GridLines ->
     Automatic, PlotLegends -> Placed[LineLegend["xzcv", LegendFunction -> Frame
    ], {0.8,0.8}], FrameLabel -> {"t / s","ln (\!\(\*SubscriptBox[\(\[Alpha]\), \(0\)]\)-\!\(\*SubscriptBox[\(\[Alpha]\), \(\[Infinity]\)]\))"}, PlotStyle -> ColorData[99,"ColorList"], ImageSize -> Large]


legends=Table["\:7ec4\:522b "<>ToString[i],{i,1,10}];
place=Table[{0.1,0.2},{i,1,10}];
framelabel=Table[{"t / s","ln (\!\(\*SubscriptBox[\(\[Alpha]\), \(0\)]\)-\!\(\*SubscriptBox[\(\[Alpha]\), \(\[Infinity]\)]\))"},{i,1,10}];
place=Table[{0.1,0.35},{i,1,10}];

InOne = ListPlot[#1,Frame -> True, LabelStyle -> Directive[Black], GridLines -> Automatic,
    FrameLabel->#4, PlotStyle -> ColorData[#5, "ColorList"],PlotRange->#6,ImageSize->Large]&;
    InOneLine = Plot[#1,{t, 0, 2500},Frame -> True, LabelStyle -> Directive[Black], GridLines -> Automatic, 
    PlotLegends -> Placed[LineLegend[ColorData[#5, "ColorList"], #2//Flatten, LegendFunction -> Frame], #3],
    FrameLabel->#4, PlotStyle -> ColorData[#5, "ColorList"],PlotRange->#6,ImageSize->Large]&;


points=InOne[data,legends,place[[1]],framelabel[[1]],97,{-8,2}];

lines=InOneLine[todraw,legends,place[[1]],framelabel[[1]],97,{-8,2}];

Show[points,lines]
inone=%;


Export["/Users/royalty/Desktop/Experiments_for_Chemistry/physical_chemistry/Kecai_Xuan/exp7/inone.jpg",inone]


(* ::Subsubsection:: *)
(*\:8ba1\:7b97\:521d\:59cb\:65cb\:5149\:5ea6*)


initial=Table[linearmodel[[i]]["BestFitParameters"][[1]],{i,1,10}];


Table[Solve[Log[x-inf[[i]]]==initial[[i]],x],{i,1,10}]//Flatten


(* ::Subsubsection:: *)
(*\:6b8b\:5dee\:5206\:6790*)


residual=Table[ListPlot[linearmodel[[i]]["FitResiduals"],Filling->Axis,PlotTheme->"Scientific",FrameLabel->{"\:6570\:636e\:70b9","\:6b8b\:5dee"}],{i,1,10}];
residual2=ListPlot[linearmodel[[2]]["FitResiduals"],Filling->Axis,PlotTheme->"Scientific",FrameLabel->{"\:6570\:636e\:70b9","\:6b8b\:5dee"}]
residual9=ListPlot[linearmodel[[9]]["FitResiduals"],Filling->Axis,PlotTheme->"Scientific",FrameLabel->{"\:6570\:636e\:70b9","\:6b8b\:5dee"}]


linearmodel[[9]]["StudentizedResiduals"]


qq=QuantilePlot[linearmodel[[2]]["StudentizedResiduals"],Table[InverseCDF[NormalDistribution[],q],{q,1/100,99/100,1/100}],PlotTheme->"Scientific",FrameLabel->{"Student\:5206\:5e03\:5206\:4f4d\:6570","\:5b9e\:9645\:6570\:636e\:5206\:4f4d\:6570"}]


residualassemble=GraphicsGrid[Partition[residual,2]]


Export["/Users/royalty/Desktop/residual2.jpg",residual2]
Export["/Users/royalty/Desktop/residual9.jpg",residual9]


Export["/Users/royalty/Desktop/qq.jpg",qq]


(* ::Text:: *)
(*\:4ece\:6b8b\:5dee\:56fe\:4e2d\:5f88\:660e\:663e\:53ef\:4ee5\:770b\:51fa\:ff0c\:6709\:67d0\:79cd\:5f88\:660e\:663e\:7684\:6a21\:5f0f\:5728\:4f7f\:6570\:636e\:70b9\:504f\:79bb\:4e00\:7ea7\:53cd\:5e94*)


(* ::Subsection:: *)
(*\:4e0b\:9762\:8fdb\:884c\:975e\:7ebf\:6027\:62df\:5408*)


(* ::Section:: *)
(*\:975e\:7ebf\:6027\:62df\:5408*)


(* ::Subsection:: *)
(*\:91cd\:65b0\:5bfc\:5165*)


path="/Users/royalty/Desktop/Experiments_for_Chemistry/physical_chemistry";
rawdata=Import[path<>"/Kecai_Xuan/exp7/data/data.xlsx"];
name={{1->"30\:5ea6-\:4f4e\:7cd6-\:4f4e\:9178"},{2->"30\:5ea6-\:4f4e\:7cd6-\:9ad8\:9178"},{3->"30\:5ea6-\:9ad8\:7cd6-\:4f4e\:9178"},{4->"30\:5ea6-\:9ad8\:7cd6-\:9ad8\:9178"},{5->"35\:5ea6-\:4f4e\:7cd6-\:4f4e\:9178"},{6->"35\:5ea6-\:4f4e\:7cd6-\:9ad8\:9178"},{7->"35\:5ea6-\:9ad8\:7cd6-\:4f4e\:9178"},{8->"35\:5ea6-\:9ad8\:7cd6-\:9ad8\:9178"},{9->"40\:5ea6-\:4f4e\:7cd6-\:4f4e\:9178-1"},{10->"40\:5ea6-\:4f4e\:7cd6-\:4f4e\:9178-2"}};
name=name//Flatten;
absolute = Table[AbsoluteTime[rawdata[[i, 1, 1]]], {i, 1, 10}];
inf = {-0.4525,-0.4814,-0.9046,-0.9253,-0.2103,-0.4476,-0.8321,-0.8528,-0.3739,-0.3920};

data=rawdata;
For[i = 1, i <= 10, i++,
    l = Length[data[[i]]];
    For[j = 1, j <= l, j++,
        data[[i,j,1]] = AbsoluteTime[data[[i,j,1]]];
    ]
]
For[i = 1, i <= 10, i++,
    l = Length[data[[i]]];
    For[j = 1, j <= l, j++,
        data[[i,j,1]] = data[[i,j,1]] - absolute[[i]];
    ]
]
(*\:5f97\:5230\:4ee5\:79d2\:4e3a\:5355\:4f4d\:7684\:7edd\:5bf9\:65f6\:95f4*)


ListPlot[data[[1]]]


(* ::Subsection:: *)
(*\:81ea\:5b9a\:4e49\:51fd\:6570\:7684\:56de\:5f52\:5206\:6790*)


(* ::Subsubsection:: *)
(*\:5efa\:7acb\:56de\:5f52\:6a21\:578b*)


Clear["Global`*"]


nonlineardata = data;

Clear[{Subscript[\[Alpha], 0],Subscript[\[Alpha], \[Infinity]],k}]
model=(Subscript[\[Alpha], 0]-Subscript[\[Alpha], \[Infinity]])E^(-k t)+Subscript[\[Alpha], \[Infinity]];

nonlinearfit=FindFit[nonlineardata[[1]],model,{Subscript[\[Alpha], 0],Subscript[\[Alpha], \[Infinity]],k},t];
modelf=Function[{t},Evaluate[model/.nonlinearfit]];
TraditionalForm[modelf]

Show[ListPlot[nonlineardata[[1]],PlotLabel->HoldForm[\:975e\:7ebf\:6027\:56de\:5f52],PlotTheme->"Scientific"],Plot[modelf[t],{t,0,2500},PlotTheme->"Detailed"]]


model=(a0-a1)E^(-k t)+a1;

nonlinearfit = Table[FindFit[nonlineardata[[i]],model,{a0,a1,k},t],{i,1,10}];
nonlinearmodel = Table[Function[{t},Evaluate[model/.(nonlinearfit[[i]])]],{i,1,10}];
nonlinearmodel//Column
nonlinearfit//Column


Show[Plot[nonlinearmodel[[5]][t], {t, -50, 2500}, PlotTheme -> "Detailed",PlotLegends->None,
      Frame -> True, FrameLabel -> {"t / s", "\!\(\*TemplateBox[<|\"boxes\" -> FormBox[\"\[Alpha]\", TraditionalForm], \"errors\" -> {}, \"input\" -> \"\\\\alpha\", \"state\" -> \"Boxes\"|>,\n\"TeXAssistantTemplate\"]\)"
    }, PlotStyle -> Directive[Dashed, Thickness[0.01]]], ListPlot[nonlineardata
    [[5]],  PlotStyle -> Orange]]


Export["/Users/royalty/Desktop/nonlinear.jpg",%]


l0=Table[nonlinearmodel[[5]][t],{t,time}]


\:6570\:636e\:70b9 \:6b8b\:5dee


l0=Table[nonlinearmodel[[5]][t],{t,time}];
Length[nonlineardata[[5]]];
residualnonlinear5=Table[nonlineardata[[5,i,2]]-l0[[i]],{i,81}];
ListPlot[residualnonlinear5,Frame->True,FrameLabel -> {"\:6570\:636e\:70b9", "\:6b8b\:5dee"
    },Filling->Axis]


Export["/Users/royalty/Desktop/renonlinear.jpg",%]


modelplot = Plot[#2[t], {t, #1[[1, 1]], #1[[Length[#1], 1]]}, PlotRange
     -> Full, Frame -> True, LabelStyle -> Directive[Black], GridLines ->
     Automatic, PlotLegends -> Placed[LineLegend[#3, LegendFunction -> Frame
    ], #4], FrameLabel -> #5, PlotStyle -> #6, ImageSize -> Large]&;


(* ::Subsubsection:: *)
(*\:7b26\:53f7\:56de\:5f52*)


symregression=Table[FindFormula[data[[i]]],{i,1,10}](*MATHEMATICA\:5185\:7f6e\:51fd\:6570\:ff0c\:76f4\:63a5\:627e\:5230\:4e00\:7ec4\:6570\:636e\:7684\:6700\:4f73\:62df\:5408\:ff0c\:53ef\:80fd\:4f1a\:4e0e\:5176\:4ed6\:65b9\:6cd5\:5f97\:5230\:7684\:7ed3\:679c\:6709\:51fa\:5165*)


Show[Plot[f[t], {t, 0, 2397}, PlotTheme -> "Detailed",
     PlotLegends -> {"f(t)"
    }, Frame -> True, PlotStyle -> Directive[Dashed, Thickness[0.01]]], ListPlot[nonlineardata
    [[5]], PlotLegends -> {"\:7ec4\:522b 5"}, PlotStyle -> Orange]]


(* ::Section:: *)
(*\:5bf9\:526f\:53cd\:5e94\:7684\:63a2\:7a76*)


residualassemble


(* ::Subsection:: *)
(*\:5982\:679c\:540c\:65f6\:4f34\:6709\:4e00\:4e2a\:672a\:77e5\:7684\:4e8c\:7ea7\:526f\:53cd\:5e94*)


sol=NDSolve[{c'[t]==-14.88*10^-4 c[t]- c[t]^2,c[0]==0.33411231132958863`},c,t][[1]]


Manipulate[sol=NDSolve[{c'[t]==-14.88*10^-4 c[t]-n c[t]^2,c[0]==0.9153`},c,t][[1]];
    Plot[Evaluate[c[t]/.sol],{t,20,1000}],{n,1,10}]


Plot[Evaluate[c[t]/.sol],{t,20,1000}]


DSolve[c'[t]==-k1 c[t],c,t]


data[[2]]


DSolve[{c'[t]==-k1 c[t]-k2 c[t]^2},c,t][[1,1,2,2]]/.C[1]->c1


model = -(Sqrt[k1]/Sqrt[E^(2 k1 (-c1+t))-k2])

nonlinearfit = Table[FindFit[nonlineardata[[i]],model,{k1,k2,c1},t],{i,1,10}];
nonlinearmodel = Table[Function[{t},Evaluate[model/.(nonlinearfit[[i]])]],{i,1,10}];
nonlinearmodel//Column
nonlinearfit//Column


nonlineardata


DSolve[{c'[t]==-k1 c[t]^2,c[0]==c0},c,t][[1,1,2,2]]


g[t_]:=1/(1+1 *0.1 t)


Plot[Log[g[t]],{t,0,100}]


ListPlot[Table[Log[g[t]],{t,0,100}]]


Clear[c,t]


(* ::Subsubsection:: *)
(*\:7ed3\:8bba\:ff1a\:5047\:8bbe\:4e0d\:6210\:7acb*)


(* ::Subsection:: *)
(*\:731c\:6d4b\:ff1a\:751f\:6210\:7269\:4ee5\:4e00\:7ea7\:5206\:89e3*)


DSolve[{c1'[t]==-k1 c1[t],c2'[t]==k1 c1[t]-k2 c2[t],c1[0]==c0,c2[0]==0},{c1,c2},t]


rotate[t_] := a1 c0 E^(-k1 t) - a2 (c0 E^(-k1 t-k2 t) (-E^(k1 t)+E^(k2 t)) k1)/(k1-k2)


-((c0 E^(-k1 t-k2 t) (-E^(k1 t)+E^(k2 t)) k1)/(k1-k2))//TeXForm


rotate[0]
Limit[rotate[t],t->\[Infinity]]
rotate[t]


Solve[rotate'[t]==0,t]
Solve[rotate''[t]==0,t]


rotate[t]


Log[(-a1 k1+a2 k1+a1 k2)/(a2 k2)]/(k1-k2)//TeXForm


Log[(-a1 k1+a2 k1+a1 k2)/(a2 k2)]/(k1-k2)//TeXForm


(* ::Section::Closed:: *)
(*\:6570\:636e\:8868\:683c\:8f93\:51fa*)


rawdata[[1,1]]
DateString/@rawdata[[1,1]]


output=rawdata


out4=rawdata[[4]];
out8=rawdata[[8]];


For[i=1,i<=Length[out8],i++,
    out8[[i,1]]=DateString[rawdata[[8,i,1]]]
]
a=Take[out8,36];
b=Take[out8,-35];
Join[a,b,2]
Export["/Users/royalty/Desktop/dump.txt",%]



