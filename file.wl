(* ::Package:: *)

BeginPackage["DataFile`"]

Unprotect @@ Names["DataFile`*"];

ClearAll @@ Names["DataFile`*"];

ImportDataFile::usage="input the main path and experiment number, please formalize the import txt.\n
ImportDataFile[path,n]"

ExportJpg::usage="export the images for further LaTeX use\n 
ExportJpg[path,images,number]"

ImageCode::usage="ImageCode[path_,number_,width_,caption_,label_]"

TableCode::usage="TableCode[table_]"


Begin["`Private`"]

ImportDataFile[localpath_,number_]:=Module[
	{names,filelength,datain,x,j},
	SetDirectory[localpath<>"/Kecai_Xuan/exp"<>ToString[number]<>"/PB20030874_Kecai_Xuan_data_for_exp"<>ToString[number]<>"/formalized_input"];
	names=FileNames[];
	filelength=Length[names];
	datain=Array[x,filelength];
	For[j=1,j<=filelength,j++,datain[[j]]=Import[ToString[j]<>".txt","Table"];
];
	SetDirectory[localpath];
	datain
]

ExportJpg[localpath_,images_,number_]:=Module[
	{j,l=Length[images]},
	SetDirectory[localpath<>"/Kecai_Xuan/exp"<>ToString[number]<>"/figure"];
	For[j=1,j<=l,j++,
		Export["Figure_"<>ToString[j]<>".jpg",images[[j]]]
	];
	SetDirectory[localpath];
]

ImageCode[localpath_,number_,width_,caption_,label_]:=Module[
	{j,l,filename,texcode},
	SetDirectory[localpath<>"/Kecai_Xuan/exp"<>ToString[number]<>"/figure"];
	filename=FileNames[];
	l=Length[filename];
	texcode=Array[x,l];
	For[j=1,j<=l,j++,
		texcode[[j]]="\\"<>"begin{figure}[ht]\n"<>"\t\\"<>"centering\n"<>"\t\\"<>"includegraphics[width="<>ToString[width[[j]]]<>"\\"<>"textwidth]{"<>ToString[filename[[j]]]<>"}\n"<>"\t\\"<>"caption{"<>ToString[caption[[j]]]<>"}\n"<>"\t\\"<>"label{fig:"<>ToString[label[[j]]]<>"}\n"<>"\\"<>"end{figure}\n"
	];
	SetDirectory[localpath];
	texcode
]

TableCode[table_]:=Module[
	{j,k,l,scale=Dimensions[table],textable,texcode},
	textable=Array[x,scale[[1]]];
	For[j=1,j<=scale[[1]],j++,
		textable[[j]]="\t";
	];
	For[j=1,j<=scale[[1]],j++,
		For[k=1,k<=scale[[2]],k++,
			textable[[j]]=textable[[j]]<>ToString[table[[j,k]]];
			If[k==scale[[2]],textable[[j]]=textable[[j]]<>"\t\\\\",textable[[j]]=textable[[j]]<>"\t&\t"];
		]
	];
	
	texcode="  ";
	For[j=1,j<=scale[[1]],j++,
		texcode=texcode<>textable[[j]];
	];
	texcode
]


End[]

EndPackage[]
