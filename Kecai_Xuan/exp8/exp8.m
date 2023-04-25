(* ::Package:: *)

(* ::Section:: *)
(*\:5bfc\:5165\:6570\:636e\:4e0e\:521d\:59cb\:5316*)


(* ::Subsection:: *)
(*\:51fd\:6570*)


TimeRefine[datelist_] := Module[
	{l = Length[datelist],refined,i,absolute},
	refined = Array[f,l];
	absolute = AbsoluteTime[datelist[[1,1]]];
	For[i = 1,i<=l,i++,
		refined[[i]] = {AbsoluteTime[datelist[[i,1]]] - absolute,datelist[[i,2]]};
	];
	refined
]

LinearRefine[datalist_,const_] := Module[
	{l = Length[datalist],refined,i},
	refined = Array[f,l];
	For[i = 1,i<=l,i++,
		If[datalist[[i,1]] != 0,
			refined[[i]] = {datalist[[i,2]],(const - datalist[[i,2]])/datalist[[i,1]]},
			refined[[i]] = "illigal imput";
		]
	];
	refined
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


LinearFitAll[datalist_,x_]:=Module[
	{l=Length[datalist],result},
	For[i=1,i<=l,i++,
		If[i==1,
			result = {LinearModelFit[datalist[[1]],x,x]},
			result = Join[result,{LinearModelFit[datalist[[i]],x,x]}]
		];
	];
	result
]

DropWisely[data_,x_]:=Module[
	{correlation},
	correlation = Table[LinearModelFit[-Drop[data,n],x,x]["CorrelationMatrix"][[1,2]],{n,1,Length[data]-5}];
	ListPlot[correlation,PlotRange->{0.99,1},PlotTheme->"Detailed"]
]


rawdata = {Import["/Users/royalty/Desktop/Experiments_for_Chemistry/physical_chemistry/Kecai_Xuan/exp8/data/30.txt",
     "Table"],Import["/Users/royalty/Desktop/Experiments_for_Chemistry/physical_chemistry/Kecai_Xuan/exp8/data/35.txt",
     "Table"]};
     
For[i=1,i<=Length[rawdata[[1]]],i++,
    rawdata[[1,i,1]]=DateObject[DateList["2022/10/14 "<>rawdata[[1,i,1]]]]
    ]
For[i=1,i<=Length[rawdata[[2]]],i++,
    rawdata[[2,i,1]]=DateObject[DateList["2022/10/14 "<>rawdata[[2,i,1]]]]
    ]


DateListPlot[rawdata[[1]]]
DateListPlot[rawdata[[2]]]


(* ::Section:: *)
(*\:7ebf\:6027\:62df\:5408*)


(* ::Subsection:: *)
(*\:6570\:636e\:53d8\:6362*)


data = rawdata;
data[[1]] = TimeRefine[rawdata[[1]]];(*\:5c06\:65f6\:95f4\:6362\:7b97\:4e3a\:79d2*)
data[[2]] = TimeRefine[rawdata[[2]]];


l0 = {data[[1,1,2]],data[[1,2,2]]};(*\:4e24\:7ec4\:6570\:636e\:5206\:522b\:7684\:521d\:59cb\:7535\:5bfc\:7387l0*)
linearfitdata = data;

linearfitdata[[1]] = Drop[LinearRefine[data[[1]],l0[[1]]],1];
linearfitdata[[2]] = Drop[LinearRefine[data[[2]],l0[[2]]],1];(*\:53d8\:6362\:6570\:636e\:ff0c\:53d8\:6210\:7ebf\:6027*)

ListPlot[linearfitdata,PlotLegends->Placed[LineLegend[{"30 \[Degree]C","35 \[Degree]C"}, LegendFunction -> Frame], {0.85,0.75}],Frame->True,PlotRange->{{860,1500},{0,0.7}}]


(* ::Text:: *)
(*\:53ef\:89c1\:5e76\:4e0d\:662f\:5b8c\:5168\:7ebf\:6027\:7684\:ff0c\:6709\:4e00\:5b9a\:7684\:5f2f\:66f2\:ff0c\:53ef\:4ee5\:53d1\:6325\:6570\:7406\:7edf\:8ba1*)


framelabel = {"\!\(\*SubscriptBox[\(L\), \(t\)]\)","\!\(\*FractionBox[\(\*SubscriptBox[\(L\), \(0\)] - \*SubscriptBox[\(L\), \(t\)]\), \(t\)]\)"};


Export["/Users/royalty/Desktop/inone.jpg",ListPlot[linearfitdata,PlotLegends->Placed[LineLegend[{"30 \[Degree]C","35 \[Degree]C"}, LegendFunction -> Frame], {0.85,0.75}],Frame->True,PlotRange->{{860,1500},{0,0.7}}]]


(* ::Subsection:: *)
(*\:4e22\:5f03\:6570\:636e\:ff0c\:4ee5\:76f8\:5173\:7cfb\:6570\:5927\:4e8e 0.999 \:4e3a\:6807\:51c6*)


DropWisely[linearfitdata[[1]],t]
DropWisely[linearfitdata[[2]],t]


(* ::Text:: *)
(*\:9009\:62e9\:4e22\:5f03\:540e\:9762 150 \:4e2a\:6570\:636e\:4e4b\:540e\:518d\:8fdb\:884c\:7ebf\:6027\:62df\:5408*)


linearmodel = LinearFitAll[{Drop[linearfitdata[[1]],150],Drop[linearfitdata[[2]],150]},t]
correlation = -{(linearmodel[[1]]["CorrelationMatrix"])[[1,2]],(linearmodel[[2]]["CorrelationMatrix"])[[1,2]]}


linearmodel[[2]]["BestFitParameters"]


(* ::Subsection:: *)
(*\:7ed8\:56fe*)


PlotRespectively=ListPlot[#1,Frame -> True, LabelStyle
     -> Directive[Black], GridLines -> Automatic, PlotLegends -> Placed[LineLegend[
    #2, LegendFunction -> Frame], #3],FrameLabel->#4, PlotStyle -> ColorData[
    #5, "ColorList"],PlotRange->#6]&;


todraw=Table[linearmodel[[i]][t],{i,1,2}]


framelabel = {"\!\(\*SubscriptBox[\(L\), \(t\)]\) (\[Mu]s\!\(\*TemplateBox[<|\"boxes\" -> FormBox[\"\[CenterDot]\", TraditionalForm], \"errors\" -> {}, \"input\" -> \"\\\\cdot\", \"state\" -> \"Boxes\"|>,\n\"TeXAssistantTemplate\"]\)\!\(\*SuperscriptBox[\(cm\), \(-1\)]\))","\!\(\*FractionBox[\((\*SubscriptBox[\(L\), \(0\)] - \*SubscriptBox[\(L\), \(t\)])\), \(t\)]\) (\[Mu]s\!\(\*TemplateBox[<|\"boxes\" -> FormBox[\"\[CenterDot]\", TraditionalForm], \"errors\" -> {}, \"input\" -> \"\\\\cdot\", \"state\" -> \"Boxes\"|>,\n\"TeXAssistantTemplate\"]\)\!\(\*SuperscriptBox[\(cm\), \(-1\)]\)\!\(\*TemplateBox[<|\"boxes\" -> FormBox[\"\[CenterDot]\", TraditionalForm], \"errors\" -> {}, \"input\" -> \"\\\\cdot\", \"state\" -> \"Boxes\"|>,\n\"TeXAssistantTemplate\"]\)\!\(\*SuperscriptBox[\(t\), \(-1\)]\))"};

point1=PlotRespectively[linearfitdata[[1]],{"30 \:5ea6\:5b9e\:9a8c\:7ed3\:679c"},{0.2,0.8},framelabel,78,Full];
point2=PlotRespectively[linearfitdata[[2]],{"35 \:5ea6\:5b9e\:9a8c\:7ed3\:679c"},{0.2,0.8},framelabel,68,Full];

line1= Plot[todraw[[1]], {t, 890, 1500}, PlotRange
     -> Full, Frame -> True, LabelStyle -> Directive[Black], GridLines ->
     Automatic, PlotLegends -> Placed[LineLegend["xzcv", LegendFunction -> Frame
    ], {0.2,0.8}], FrameLabel -> framelabel, PlotStyle -> Directive[Thickness[0.005],ColorData[98,"ColorList"]], ImageSize -> Large];
line2= Plot[todraw[[2]], {t, 900, 1400}, PlotRange
     -> Full, Frame -> True, LabelStyle -> Directive[Black], GridLines ->
     Automatic, PlotLegends -> Placed[LineLegend["xzcv", LegendFunction -> Frame
    ], {0.2,0.8}], FrameLabel -> framelabel, PlotStyle -> Directive[Thickness[0.005],ColorData[97,"ColorList"]], ImageSize -> Large];
    
first=Show[line1,point1]
second=Show[line2,point2]


Export["/Users/royalty/Desktop/Experiments_for_Chemistry/physical_chemistry/Kecai_Xuan/exp8/30degree.jpg",first]
Export["/Users/royalty/Desktop/Experiments_for_Chemistry/physical_chemistry/Kecai_Xuan/exp8/35degree.jpg",second]


{0.03,0.0254,0.0292,0.0277}/204.221


0.0001468996822070208`/26.5*1000
0.00012437506426861094`/22.9*1000
0.00014298235734816692`/26.35*1000
0.00013563737323781587`/25*1000


(5.42-5.43)/5.42


8.06/5.42*0.1


0.469/(8.06*10^-4)


(* ::Section:: *)
(*\:6570\:636e\:8868\:683c\:8f93\:51fa*)


out1=rawdata[[1]]//LatexTable;
out2=rawdata[[2]]//LatexTable;
Length[out1]
Length[out2]


Export["/Users/royalty/Desktop/dump1.txt",out1]
Export["/Users/royalty/Desktop/dump2.txt",out2]



