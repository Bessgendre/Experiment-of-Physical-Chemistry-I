(* ::Package:: *)

BeginPackage["Draw`"]

Unprotect @@ Names["Draw`*"];

ClearAll @@ Names["Draw`*"];

FitModelPlot::usage="FitModelPlot[datafit_,models_,legends_,place_,framelabel_,color_]:"

PlotRespectively::usage = "draw a ListLinePlot of a Table with ColorData, the legends and its place are required.\n 
	Only one set of data is allowed.\n
	PlotRespectively[data,legends,place,framelabel,number,range]"
	
PlotAll::usage="draw a series of ListLinePlot using PlotRespectively\n
	plotall[data,legends,place,framelabel,number,range]"
	
PlotInOne::usage="draw one plot with sets of data, usually is used for comparison.\n
	PlotInOne[data_sets,legends,place,framelabel,number,range]"

LegendsName::usage="If the files' name is already the legends of the lines, you can use this function to get them.
	\nLegendsName[localpath_,number]"


Begin["`Private`"]

FitModelPlot= Plot[#2[x],{x,#1[[1,1]],#1[[Length[#1],1]]},PlotRange -> Full, Frame -> True, LabelStyle
     -> Directive[Black], GridLines -> Automatic, PlotLegends -> Placed[LineLegend[
    #3, LegendFunction -> Frame], #4],FrameLabel->#5, PlotStyle -> ColorData[
    #6, "ColorList"]]&;

PlotRespectively = ListLinePlot[#1,Frame -> True, LabelStyle
     -> Directive[Black], GridLines -> Automatic, PlotLegends -> Placed[LineLegend[
    #2, LegendFunction -> Frame], #3],FrameLabel->#4, PlotStyle -> ColorData[
    #5, "ColorList"],PlotRange->#6]&;
    
PlotAll[data_,legends_,place_,framelabel_,color_,range_]:=Module[
	{list=data,l=Length[data],images,x,j},
	images=Array[x,Length[data]];
	For[j=1,j<=l,j++,
	images[[j]]=PlotRespectively[data[[j]],legends[[j]],place[[j]],framelabel[[j]],color,range[[j]]];
	];
	images
]

PlotInOne = ListLinePlot[#1,Frame -> True, LabelStyle
     -> Directive[Black], GridLines -> Automatic, PlotLegends -> Placed[LineLegend[
   ColorData[
    #5, "ColorList"], #2//Flatten, LegendFunction -> Frame], #3],FrameLabel->#4, PlotStyle -> ColorData[
    #5, "ColorList"],PlotRange->#6,ImageSize->Large]&;

LegendsName[localpath_,number_]:=Module[
	{x,le,i,j,l,leg},
	SetDirectory[localpath<>"/Kecai_Xuan/exp"<>ToString[number]<>"/PB20030874_Kecai_Xuan_data_for_exp"<>ToString[number]];
	le=Table[{ToString[FileNames["*.txt"][[i]]]},{i,Length[FileNames["*.txt"]]}];
	l=Length[le];
	leg=Array[x,l];
	For[j=1,j<=l,j++,
		leg[[j]]=StringReplace[le[[j]],".txt"->""];
	];
	SetDirectory[localpath];
	leg
]





End[]

EndPackage[]
