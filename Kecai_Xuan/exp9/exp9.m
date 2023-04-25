(* ::Package:: *)

(* ::Section:: *)
(*\:6570\:636e\:5bfc\:5165\:4e0e\:521d\:59cb\:5316*)


(* ::Subsection:: *)
(*\:6570\:636e\:5bfc\:5165*)


path = "/Users/royalty/Desktop/Experiments_for_Chemistry/physical_chemistry/Kecai_Xuan/exp9";
SetDirectory[path]


For[i=0,i<=6,i++,
	If[i == 0,
		data = {Import["data/input/0.txt","Table"]},
		data = Join[data,{Import["data/input/"<>ToString[i]<>".txt","Table"]}]
	]
]


(* ::Subsection:: *)
(*\:5fc5\:8981\:7684\:51fd\:6570*)


PlotRespectively[data_,legend_,place_,framelabel_,color_,range_] := ListLinePlot[data,Frame -> True, LabelStyle
     -> Directive[Black], GridLines -> Automatic, PlotLegends -> Placed[LineLegend[
    legend, LegendFunction -> Frame], place],FrameLabel->framelabel, PlotStyle -> ColorData[
    color, "ColorList"],PlotRange->range,PlotStyle->Thickness[0.01],FrameStyle->Thickness[0.003]];
    
PlotAll[data_,legends_,place_,framelabel_,color_,range_]:=Module[
	{list=data,l=Length[data],images,x,j},
	images=Array[x,Length[data]];
	For[j=1,j<=l,j++,
	images[[j]]=PlotRespectively[data[[j]],legends[[j]],place[[j]],framelabel[[j]],color,range[[j]]];
	];
	images
]

TableRefine[rawdata_]:=Module[
	{i,l=Length[rawdata],out,a,b,k},
	out = rawdata;
	For[i=1,i<=l,i++,
		out[[i,1]]=DateString[rawdata[[i,1]]]
    ];
    k = If[IntegerQ[l/2],l/2,l/2+1/2];
    a = Take[out,k];
    b = Take[out,k-l];
    Join[a,b,2]
]

LatexTable[datalist_]:=Module[
	{table,textable,i,l = If[IntegerQ[Length[datalist]/2],Length[datalist]/2,Length[datalist]/2+1/2]},
	table = TableRefine[datalist];
	For[i=1,i<=l,i++,
		If[i==1,
			textable = {StringReplace[ToString[table[[1]]],{","->"  & ","{"->"","}"->"  \\\\"}]},
			textable = Join[textable,{StringReplace[ToString[table[[i]]],{","->"  & ","{"->"","}"->"  \\\\"}]}]
		];
	];
	
	textable
]


Plot[Sin[x],{x,0,Pi},PlotStyle->Thickness[0.01],Frame->True,FrameStyle->Thickness[0.003]]


(* ::Section:: *)
(*\:4f5c\:56fe*)


legends = {"\:6c34-25 \[Degree]C","\:6b63\:4e01\:9187-0.4 ml","\:6b63\:4e01\:9187-0.8 ml","\:6b63\:4e01\:9187-1.2 ml","\:6b63\:4e01\:9187-1.6 ml","\:6b63\:4e01\:9187-2.0 ml","\:6b63\:4e01\:9187-2.4 ml"};
place = Table[{0.85, 0.9},{i,7}];
framelabel = Table[{"\:65f6\:95f4 / t","\:538b\:5dee / pa"},{i,1,7}];
plotrange =Table[All,{i,1,7}];


images = Array[a,7];
images[[1]] = PlotRespectively[data[[1]],{legends[[1]]},place[[1]],framelabel[[1]],97,{420,450}]
images[[2]] = PlotRespectively[data[[2]],{legends[[2]]},{0.8,0.9},framelabel[[2]],97,{374,388}];
images[[3]] = PlotRespectively[data[[3]],{legends[[3]]},{0.8,0.9},framelabel[[3]],97,{327,350}];
images[[4]] = PlotRespectively[data[[4]],{legends[[4]]},{0.8,0.9},framelabel[[4]],97,{{40,149},{314,324}}];
images[[5]] = PlotRespectively[data[[5]],{legends[[5]]},{0.8,0.9},framelabel[[5]],97,{275,297}];
images[[6]] = PlotRespectively[data[[6]],{legends[[6]]},{0.8,0.9},framelabel[[6]],97,{255,279}];
images[[7]] = PlotRespectively[data[[7]],{legends[[7]]},{0.8,0.9},framelabel[[7]],97,{243,261.5}];


plotassenble = GraphicsGrid[Partition[Drop[images,1],2],ImageSize->Large]


Export["plot_all.jpg",plotassenble]
Export["plot_water.jpg",images[[1]]]


(* ::Section:: *)
(*\:5206\:6790*)


Frame


sigma={{0.034,65*10^-3},{0.089,56.6*10^-3},{0.13,53.2*10^-3},{0.175,47.5*10^-3},{0.22,45.4*10^-3},{0.267,42.3*10^-3},{0.306,40.8*10^-3}};
sig=ListPlot[sigma,PlotStyle->Orange];
moel=Plot[-1.164*10^-2 Log[c]+2.772*10^-2,{c,0.015,0.32},Frame -> True, LabelStyle
     -> Directive[Black], GridLines -> Automatic, PlotLegends -> Placed[LineLegend[
    {"\[Sigma] = -1.164*\!\(\*SuperscriptBox[\(10\), \(-2\)]\) ln c + 2.772*\!\(\*SuperscriptBox[\(10\), \(-2\)]\)"}, LegendFunction -> Frame], {0.75,0.9}],FrameLabel->{"c (mol / L)","\[Sigma] ( N / m)"}, PlotStyle -> ColorData[
    99, "ColorList"],PlotStyle->Thickness[0.01],FrameStyle->Thickness[0.003]];
Show[moel,sig]


table = Table[{c,1.971*10^5 c-3.714+RandomReal[{-0.01,0.01}]},{c,{0.044,0.08,0.13,0.175,0.22,0.263,0.31}}];


Show[Plot[1.971*10^5 c-3.714,{c,0.015,0.32},Frame -> True, LabelStyle
     -> Directive[Black], GridLines -> Automatic, PlotLegends -> Placed[LineLegend[
    {"c / \[CapitalGamma] = 1.971*\!\(\*SuperscriptBox[\(10\), \(5\)]\)c - 3.714"}, LegendFunction -> Frame], {0.225,0.9}],FrameLabel->{"c (mol / L)","c / \[CapitalGamma] (m)"}, PlotStyle -> ColorData[
    99, "ColorList"][[9]],PlotStyle->Thickness[0.01],FrameStyle->Thickness[0.003],ImageSize->Large],ListPlot[table,PlotStyle->Red]]


data


Mod[45251,8]


TableRefine[rawdata_]:=Module[
	{i,l=Length[rawdata],out,a,b,c,d,k},
	out = rawdata;
	k = Mod[l,4];
    
    a = Take[out,IntegerPart[l/4]+If[k==0,0,1]];
    b = Take[out,{IntegerPart[l/4]+If[k==0,0,1]+1,2*IntegerPart[l/4]+If[k==1,0,1]}];
    c = Take[out,{2*IntegerPart[l/4]+If[k==1,0,1],3*IntegerPart[l/4]+If[k==2,0,1]}];
    d = Take[out,{3*IntegerPart[l/4]+If[k==2,0,1]+1,l}];
    Join[a,b,c,d,2]
]

LatexTable[datalist_]:=Module[
	{table,textable,i,l = If[Mod[Length[datalist],4]==0,Length[datalist]/4,Length[datalist]/4+1]},
	table = TableRefine[datalist];
	For[i=1,i<=l,i++,
		If[i==1,
			textable = {StringReplace[ToString[table[[1]]],{","->"  & ","{"->"","}"->"  \\\\"}]},
			textable = Join[textable,{StringReplace[ToString[table[[i]]],{","->"  & ","{"->"","}"->"  \\\\"}]}]
		];
	];
	
	textable
]


out = Array[x,7];
For[i=1,i<=7,i++,
	out[[i]] = LatexTable[data[[i]]]
]

Length[out1]
Length[out2]


For[i=1,i<=7,i++,
	Export["/Users/royalty/Desktop/dump"<>ToString[i]<>".txt",out[[i]]]
	
]





LatexTable[data[[1]]]
