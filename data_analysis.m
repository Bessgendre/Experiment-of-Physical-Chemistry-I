(* ::Package:: *)

(* ::Title:: *)
(*\:5b9e\:9a8c\:6570\:636e\:96c6\:6210\:5904\:7406\:5e73\:53f0*)


(* ::Subtitle:: *)
(*\:4e2d\:56fd\:79d1\:5b66\:6280\:672f\:5927\:5b66 \:5316\:5b66\:7269\:7406\:7cfb \:79a4\:79d1\:6750 PB20030874*)
(*Wolfram Mathematica 13.0.1.0\:ff0c\:5e73\:53f0\:7248\:672c\:ff1a1.0.0*)


(* ::Subsection::Closed:: *)
(*\:521b\:5efa\:811a\:672c*)


(* ::Input:: *)
(*#!Plus[a,b]*)


(* ::Text:: *)
(*\:81ea\:52a8\:521b\:5efa\:811a\:672chttps://www.wolfram.com/mathematica/new-in-8/mathematica-shell-scripts/mathematica--script-from-your-code.html*)


(* ::Chapter:: *)
(*\:5927\:5b66\:7269\:7406-\:57fa\:7840\:5b9e\:9a8cA*)


(* ::Section::Closed:: *)
(*\:4e00\:7ef4\:ff1a\:5747\:503c\:4e0e\:4e0d\:786e\:5b9a\:5ea6*)


(* ::Subsection::Closed:: *)
(*\:6837\:672c\:6570\:636e\:5904\:7406*)


(* ::Subsubsection:: *)
(*\:6570\:636e\:8f93\:5165*)


(* ::Input:: *)
(*Clear["Global`*"]*)
(*Tdistribution={0,12.71,4.30,3.18,2.78,2.57,2.45,2.36,2.31,2.26,2.23,2.20,2.18,2.16,2.14,2.13,2.12,2.11,2.10,2.09,2.09,1.96};(*\:8fd9\:662ft\:5206\:5e03\:9700\:8981\:4e58\:7684\:53c2\:6570\:5217\:8868*)*)
(**)
(*data1=Import["/Users/royalty/Documents/A gift for your 20th birthday/\:6570\:636e\:5904\:7406\:5e73\:53f0/sample data1.txt","List"]   (*\:4ece\:6587\:4ef6\:4e2d\:8bfb\:53d6\:6570\:636e\:ff0c\:6ce8\:610f\:6587\:4ef6\:4e2d\:6570\:636e\:7684\:6446\:653e\:5f62\:5f0f\:ff1a\:540c\:7ec4\:6570\:636e\:4ee5\:7a7a\:683c\:95f4\:65ad\:3001\:4ee5\:56de\:8f66\:7b26\:4e3a\:4e00\:7ec4\:6570\:636e\:7684\:5206\:5272*)*)
(**)
(*(*\:6216\:8005\:4e5f\:53ef\:4ee5\:624b\:52a8\:8f93\:5165\:6570\:636e\:ff1adata={1.1,1.12,1.04,1.23,1.09,1.15,1.07,1.16,1.02},\:4e0d\:8fc7\:6709\:70b9\:9ebb\:70e6*)*)
(**)
(*(*\:5230\:4f60\:7684\:7535\:8111\:4e0a\:4e4b\:540e\:6587\:4ef6\:7684\:8def\:5f84\:4f1a\:53d1\:751f\:53d8\:5316\:ff0c\:8f93\:5165Import[""]\:7684""\:65f6\:5019\:4f1a\:81ea\:52a8\:5f39\:51fa"\:6587\:4ef6\:6d4f\:89c8\:5668"\:7684\:6309\:94ae\:ff0c\:70b9\:51fb\:5373\:53ef\:627e\:5230\:8981\:5bfc\:5165\:7684\:6587\:4ef6*)*)
(**)
(*(*Export[]\:7684\:4f7f\:7528\:65b9\:6cd5\:548cImport[]\:5dee\:4e0d\:591a\:ff0c\:53c2\:89c1\:5e2e\:52a9\:6587\:6863*)*)


(* ::Subsubsection:: *)
(*\:4e0d\:786e\:5b9a\:5ea6\:8ba1\:7b97*)


(* ::Input:: *)
(*number=Length[data1];(*\:6570\:7ec4\:957f\:5ea6*)*)
(*average=Mean[data1]//N;(*\:5e73\:5747\:503c*)*)
(*st=StandardDeviation[data1]//N;(*data\:7684\:6807\:51c6\:5dee*)*)
(**)
(*(*A\:7c7b\:4e0d\:786e\:5b9a\:5ea6*)*)
(*If[*)
(*number>21,*)
(*UA=Tdistribution[[22]]*st/Sqrt[number],*)
(*UA=Tdistribution[[number]]*st/Sqrt[number];*)
(*]*)
(**)
(*(*B\:7c7b\:4e0d\:786e\:5b9a\:5ea6*)*)
(*gudu=0.05;        (*\:4f30\:8bfb\:8bef\:5dee*)*)
(*yiqi=0.05;       (*\:4eea\:5668\:8bef\:5dee*)*)
(*zhixin=3;         (*\:7f6e\:4fe1\:7cfb\:6570*)*)
(*UB=1.96*Sqrt[gudu^2+yiqi^2]/zhixin;*)
(**)
(*(*\:603b\:4e0d\:786e\:5b9a\:5ea6*)*)
(*U=Sqrt[UA^2+UB^2];*)
(**)
(*(*\:8f93\:51fa*)*)
(*Print["\:6837\:672c\:5e73\:5747\:503c:",average]*)
(*Print["\:6837\:672c\:6807\:51c6\:5dee:",st]*)
(*Print["A\:7c7b\:4e0d\:786e\:5b9a\:5ea6:",UA]*)
(*Print["B\:7c7b\:4e0d\:786e\:5b9a\:5ea6:",UB]*)
(*Print["\:5c55\:4f38\:4e0d\:786e\:5b9a\:5ea6\:ff08P=0.95\:ff09:",U]*)
(*BarChart[data1,PlotRange->Full,PlotTheme->"Detailed",ChartLabels->Placed[data1,Above],*)
(*ChartStyle->RGBColor[0.16, 0.64, 0.96]*)
(*]*)


(* ::Input:: *)
(*RandomColor[]*)


(* ::Subsection:: *)
(*\:5254\:9664\:5f02\:5e38*)


(* ::Input:: *)
(*difference=Abs[data1-average];*)
(*data1*)
(*For[i=1,i<=number, i++,*)
(*If[difference[[i]]==Max[difference],*)
(*Print["\:7b2c ",i," \:7ec4\:6570\:636e ",data1[[i]]," \:548c\:5e73\:5747\:503c\:6709\:6700\:5927\:76f8\:5bf9\:504f\:5dee ",Max[difference]/average*100,"%"];*)
(*aim=i;*)
(*Break;*)
(*]]     (*for\:5faa\:73af\:ff0c\:5bfb\:627e\:79bb\:5e73\:5747\:503c\:6700\:8fdc\:7684\:70b9*)*)
(**)
(*t=0;*)
(*If[aim==1,newdata1=data1[[2;;number]];t=1;]*)
(*If[aim==number,newdata1=data1[[1;;number-1]];t=1;]*)
(*If[t!=1,forward=data1[[1;;aim-1]];back=data1[[aim+1;;number]];newdata1=Join[forward,back];]    (*\:5254\:9664\:7f16\:53f7\:4e3aaim\:7684\:6570\:636e*)*)
(**)
(*newnumber=Length[newdata1];(*\:5e73\:5747\:503c*)*)
(*average=Mean[newdata1]//N;*)
(*newst=StandardDeviation[newdata1]//N;(*newdata\:7684\:6807\:51c6\:5dee*)*)
(*If[*)
(*newnumber>21,*)
(*newUA=Tdistribution[[22]]*newst/Sqrt[number],*)
(*newUA=Tdistribution[[number]]*newst/Sqrt[number];*)
(*](*A\:7c7b\:4e0d\:786e\:5b9a\:5ea6*)*)
(**)
(*gudu=0.05;       (*\:4f30\:8bfb\:8bef\:5dee*)*)
(*yiqi=0.05;      (*\:4eea\:5668\:8bef\:5dee*)*)
(*zhixin=3; (*\:7f6e\:4fe1\:7cfb\:6570*)*)
(*UB=1.96*Sqrt[gudu^2+yiqi^2]/zhixin;(*B\:7c7b\:4e0d\:786e\:5b9a\:5ea6*)*)
(**)
(*newU=Sqrt[newUA^2+UB^2];(*\:603b\:4e0d\:786e\:5b9a\:5ea6*)*)
(**)
(*Print["\:5254\:9664\:540e\:5e73\:5747\:503c:",average]*)
(*Print["\:5254\:9664\:540e\:6807\:51c6\:5dee:",newst,". \:76f8\:5bf9\:4e4b\:524d\:53d8\:5316\:ff1a",newst-st]*)
(*Print["\:5254\:9664\:540eA\:7c7b\:4e0d\:786e\:5b9a\:5ea6:",newUA,". \:76f8\:5bf9\:4e4b\:524d\:53d8\:5316\:ff1a",newUA-UA]*)
(*Print["\:5254\:9664\:540eB\:7c7b\:4e0d\:786e\:5b9a\:5ea6:",UB]*)
(*Print["\:5254\:9664\:540e\:5c55\:4f38\:4e0d\:786e\:5b9a\:5ea6\:ff08P=0.95\:ff09:",newU, ". \:76f8\:5bf9\:4e4b\:524d\:53d8\:5316\:ff1a",newU-U]*)
(*BarChart[data1,PlotRange->Full,PlotTheme->"Detailed",ChartLabels->Placed[data1,Above],*)
(*ChartStyle->RGBColor[0.16, 0.64, 0.96]]*)
(**)
(*t=0;*)
(*t=Input["\:662f\:5426\:4ece\:6d4b\:91cf\:5e8f\:5217\:4e2d\:5254\:9664\:6b64\:6570\:ff08\:6837\:672c\:5bb9\:91cf\:9700\:8981\:8db3\:591f\:5927\:ff09\:ff1f\:786e\:8ba4\:8bf7\:586b1\:ff1a"];*)
(*If[t==1,data1=newdata1;number=newnumber;data1,data1]*)
(*BarChart[data1,PlotRange->Full,PlotTheme->"Detailed",ChartLabels->Placed[data1,Above],*)
(*ChartStyle->Orange]*)


(* ::Input:: *)
(*Clear["Global`*"](*\:6e05\:9664\:7b26\:53f7\:53d8\:91cf\:5360\:6709\:7684\:5185\:5b58*)*)


(* ::Section::Closed:: *)
(*\:4e8c\:7ef4\:ff1a\:62df\:5408\:4e0e\:4e0d\:786e\:5b9a\:5ea6*)


(* ::Subsection::Closed:: *)
(*\:7ebf\:6027\:56de\:5f52\:4e0e\:6b8b\:5dee*)


(* ::Subsubsection:: *)
(*\:6563\:70b9\:56fe*)


(* ::Input:: *)
(*Clear["Global`*"]*)
(*Tdistribution={0,12.71,4.30,3.18,2.78,2.57,2.45,2.36,2.31,2.26,2.23,2.20,2.18,2.16,2.14,2.13,2.12,2.11,2.10,2.09,2.09,1.96};(*\:8fd9\:662ft\:5206\:5e03\:9700\:8981\:4e58\:7684\:53c2\:6570\:5217\:8868*)*)
(*data2=Import["/Users/royalty/Documents/A gift for your 20th birthday/\:6570\:636e\:5904\:7406\:5e73\:53f0/sample data2.txt","Table"];(*\:6ce8\:610f\:ff0c\:8fd9\:91cc\:662f\:4ee5"Table"(\:8868\:683c)\:683c\:5f0f\:5bfc\:5165\:4e8c\:7ef4\:6570\:636e\:ff0c\:524d\:9762\:4e00\:7ef4\:6570\:636e\:7684\:5bfc\:5165\:53ea\:9700\:8981"List"(\:5217\:8868)*)*)
(*ListPlot[data2,PlotTheme->"Detailed",PlotStyle->Directive[PointSize->0.015]]*)
(*number=Length[data2];*)
(**)


(* ::Subsubsection:: *)
(*\:7ebf\:6027\:56de\:5f52\:6a21\:578b*)


(* ::Input:: *)
(*lm=LinearModelFit[data2,x,x];*)
(*TraditionalForm[lm]*)
(*Show[Plot[lm[x],{x,100,280},PlotLabel->HoldForm[\:7ebf\:6027\:56de\:5f52],PlotTheme->"Detailed"],ListPlot[data2,PlotStyle->Directive[Orange,PointSize->0.015],PlotTheme->"Detailed"]]*)
(*ListPlot[lm["FitResiduals"],Frame->True,PlotRange->All,PlotLabel->HoldForm[\:6b8b\:5dee],PlotStyle->Directive[PointSize->0.015],PlotTheme->"Scientific"]*)


(* ::Subsubsection:: *)
(*\:4e0d\:786e\:5b9a\:5ea6\:8ba1\:7b97*)


(* ::Input:: *)
(*R=-lm["CorrelationMatrix"][[1,2]];*)
(*b=lm["BestFitParameters"][[1]];*)
(*k=lm["BestFitParameters"][[2]];*)
(*Print["\:76f8\:5173\:7cfb\:6570:",R]*)
(*Print["\:622a\:8ddd:",b]*)
(*Print["\:659c\:7387:",k]*)
(**)
(*Print["\:5404\:70b9\:6a2a\:5750\:6807:", Table[data2[[i,1]],{i,1,number}]]*)
(*Print["\:6a2a\:5750\:6807\:5e73\:65b9\:5e73\:5747\:503c\:ff1a",average=Total[Table[data2[[i,1]]^2,{i,1,number}]]/number]*)
(*s1=k*Sqrt[(1/R-1)/(number-2)];*)
(*s2=Sqrt[average]*s1;*)
(*If[number-2>20,*)
(*u2=s2*Tdistribution[[22]];*)
(*u1=s1*Tdistribution[[22]],*)
(**)
(*u2=s2*Tdistribution[[number-2]];*)
(*  u1=s1*Tdistribution[[number-2]];*)
(*]*)
(*Print["\:659c\:7387\:6807\:51c6\:5dee:",s1]*)
(*Print["\:622a\:8ddd\:6807\:51c6\:5dee:",s2]*)
(*Print["\:659c\:7387\:5c55\:4f38\:4e0d\:786e\:5b9a\:5ea6:",u1]*)
(*Print["\:622a\:8ddd\:5c55\:4f38\:4e0d\:786e\:5b9a\:5ea6:",u2]*)


(* ::Subsection:: *)
(*\:81ea\:5b9a\:4e49\:51fd\:6570\:7684\:56de\:5f52\:5206\:6790*)


(* ::Subsubsection:: *)
(*\:6563\:70b9\:56fe*)


(* ::Input:: *)
(*Tdistribution={0,12.71,4.30,3.18,2.78,2.57,2.45,2.36,2.31,2.26,2.23,2.20,2.18,2.16,2.14,2.13,2.12,2.11,2.10,2.09,2.09,1.96};(*\:8fd9\:662ft\:5206\:5e03\:9700\:8981\:4e58\:7684\:53c2\:6570\:5217\:8868*)*)
(*data=Table[{i,3i^2+20+RandomReal[{-10,10}]},{i,1,10,0.5}];(*\:8fd9\:662f\:4e00\:4e9b\:4ee53x^2+20\:4e3a\:4e2d\:5fc3\:6ce2*)
(*\:52a8\:7684\:968f\:673a\:6570\:5217\:ff0c\:53ea\:662f\:793a\:4f8b*)*)
(*ListPlot[data,PlotTheme->"Detailed"]*)


(* ::Subsubsection:: *)
(*\:5efa\:7acb\:56de\:5f52\:6a21\:578b*)


(* ::Input:: *)
(*Clear[a,b,c]*)
(*model=a x^2+b x+c;*)
(*fit=FindFit[data,model,{a,b,c},x];*)
(*modelf=Function[{x},Evaluate[model/.fit]];*)
(*TraditionalForm[modelf]*)
(*Show[ListPlot[data,PlotLabel->HoldForm[\:975e\:7ebf\:6027\:56de\:5f52],PlotTheme->"Scientific"],Plot[modelf[x],{x,0,10},PlotTheme->"Detailed"]]*)


(* ::Input:: *)
(*FindFormula[data](*MATHEMATICA\:5185\:7f6e\:51fd\:6570\:ff0c\:76f4\:63a5\:627e\:5230\:4e00\:7ec4\:6570\:636e\:7684\:6700\:4f73\:62df\:5408\:ff0c\:53ef\:80fd\:4f1a\:4e0e\:5176\:4ed6\:65b9\:6cd5\:5f97\:5230\:7684\:7ed3\:679c\:6709\:51fa\:5165*)*)


(* ::Input:: *)
(*Plot[(17.3506 +3.01904 #1^2.&)[\[FormalX]],{\[FormalX],-8.68769,8.68769}]*)


(* ::Chapter:: *)
(*\:7269\:7406\:5316\:5b66\:57fa\:7840\:5b9e\:9a8c\:ff08\:4e0a\:ff09*)


Clear["Global`*"]


(* ::Subsection:: *)
(*\:521d\:59cb\:5316*)


(* ::Input:: *)
(*experimentnumber=7;*)
(**)
(*(*\:5b9e\:9a8c\:7f16\:53f7,\:4e0e\:6587\:4ef6\:5939\:7f16\:53f7\:76f8\:540c\:ff0c\:6bd4\:5982\:4e00\:53f7\:5b9e\:9a8c\:6587\:4ef6\:5939\:7684\:540d\:79f0\:4e3aexp1\:ff0c\:4e8c\:53f7\:5b9e\:9a8c\:6587\:4ef6\:5939\:540d\:79f0\:4e3aexp2\:ff0c\:5426\:5219\:540e\:9762\:7684\:6587\:4ef6\:5bfc\:5165\:5bfc\:51fa\:4f1a\:6709\:62a5\:9519*)*)
(**)
(*path="/Users/royalty/Desktop/Experiments_for_Chemistry/physical_chemistry";*)
(*SetDirectory[path]*)
(**)
(*(*\:8bf7\:6ce8\:610f\:ff0cmac\:7cfb\:7edf\:8def\:5f84\:4f7f\:7528\:7684\:662f/\:ff0c\:800c windows\:7cfb\:7edf\:8def\:5f84\:662f\*)*)
(**)
(*<<draw.wl*)
(*<<file.wl*)
(*<<fitting.wl*)
(**)
(*(*\:8bfb\:5165 Wolfram \:4e2a\:4eba\:51fd\:6570\:5305\:ff0c\:5b83\:4eec\:5e94\:5f53\:5df2\:7ecf\:88ab\:653e\:5728\:4e86"/Users/royalty/Desktop/Experiments_for_Chemistry/physical_chemistry"\:91cc\:9762*)*)


(* ::Input:: *)
(*?Draw`**)


(* ::Input:: *)
(*?DataFile`**)


(* ::Input:: *)
(*?Fitting`**)


(* ::Subsection:: *)
(*\:6570\:636e\:6587\:4ef6\:57fa\:7840*)


(* ::Subsubsection:: *)
(*\:6570\:636e\:7684\:5bfc\:5165*)


(* ::Input:: *)
(*data=ImportDataFile[path,experimentnumber];*)
(*data//Length*)
(*filenumber=Length[data];*)
(**)
(*(*\:53ef\:80fd\:9700\:8981\:5254\:9664\:4e00\:4e9b\:6ca1\:6709\:5bfc\:5165\:6210\:529f\:7684\:6570\:636e\:ff0c\:8f93\:51fa\:6587\:4ef6\:7684\:957f\:5ea6\:4ee5\:68c0\:67e5*)*)


(* ::Input:: *)
(*data=Drop[data,-1];*)
(*filenumber=Length[data]*)
(**)
(*(*\:7531\:4e8eImportFiles \:51fd\:6570\:4f7f\:7528 For \:5faa\:73af\:5bfc\:5165\:540d\:79f0\:5df2\:7ecf\:6807\:51c6\:5316\:7684.txt\:6587\:4ef6\:ff0c\:6587\:4ef6\:4e2a\:6570\:5305\:542b\:4e86\:7cfb\:7edf\:9690\:85cf\:7684\:6587\:4ef6\:ff0c\:6240\:4ee5\:6b64\:5904\:9700\:8981\:624b\:52a8\:53bb\:9664\:8fd9\:4e9b\:672a\:5bfc\:5165\:6210\:529f\:7684\:6587\:4ef6*)*)


(* ::Subsubsection:: *)
(*\:57fa\:7840\:7ed8\:56fe*)


(* ::Input:: *)
(*legends=LegendsName[path,experimentnumber]*)
(**)
(*(*\:53ef\:80fd\:9700\:8981\:8c03\:6574\:4e00\:4e0b\:56fe\:4f8b\:7684\:987a\:5e8f\:ff0c\:548c\:5bfc\:5165\:6587\:4ef6\:7684\:987a\:5e8f\:53ef\:80fd\:4e0d\:540c*)*)


(* ::Input:: *)
(*(*legends={{"\:7ec4\:522b1"},{"\:7ec4\:522b2"},{"\:7ec4\:522b3"},{"\:7ec4\:522b4"},{"\:7ec4\:522b5"},{"\:7ec4\:522b6"},{"\:7ec4\:522b7"},{"\:6781\:78b1"},{"\:6781\:9178"},{"\:57fa\:7ebf"}};*)*)
(**)
(*(*\:56fe\:4f8b\:5185\:5bb9*)*)
(**)
(*place= Table[{0.87, 0.9},{i,1,filenumber}];*)
(*(*place={{0.92, 0.9},{0.92, 0.9},{0.92, 0.9},{0.92, 0.9},{0.92, 0.9},{0.92, 0.9},{0.92, 0.9},{0.92, 0.9},{0.92, 0.9},{0.92, 0.9}};*)*)
(**)
(*(*\:56fe\:4f8b\:4f4d\:7f6e*)*)
(**)
(*framelabel=Table[{"\:6ce2\:957f / nm","\:5438\:5149\:5ea6"},{i,1,filenumber}];*)
(**)
(*(*{{"\:6ce2\:957f / nm","\:5438\:5149\:5ea6"},{"\:6ce2\:957f / nm","\:5438\:5149\:5ea6"},{"\:6ce2\:957f / nm","\:5438\:5149\:5ea6"},{"\:6ce2\:957f / nm","\:5438\:5149\:5ea6"},{"\:6ce2\:957f / nm","\:5438\:5149\:5ea6"},{"\:6ce2\:957f / nm","\:5438\:5149\:5ea6"},{"\:6ce2\:957f / nm","\:5438\:5149\:5ea6"},{"\:6ce2\:957f / nm","\:5438\:5149\:5ea6"},{"\:6ce2\:957f / nm","\:5438\:5149\:5ea6"},{"\:6ce2\:957f / nm","\:5438\:5149\:5ea6"}};*)*)
(**)
(*(*\:8f74\:6807\:7b7e\:5982\:679c\:76f8\:540c\:53ef\:4ee5\:4e00\:6b21\:6027\:8bbe\:7f6e\:ff0c\:53ef\:4ee5\:5206\:522b\:8bbe\:7f6e*)*)
(**)
(*plotrange=Table[All,{i,1,filenumber}];*)
(**)
(*(*plotrange={{-0.1,0.8},{-0.1,0.8},{-0.1,0.8},{-0.1,0.8},{-0.1,0.8},{-0.1,0.8},{-0.1,0.8},{-0.1,0.8},{-0.1,0.8},{-0.1,0.8}};*)*)
(**)
(*(*\:56fe\:4f8b\:3001\:4f4d\:7f6e\:4ee5\:53ca\:8fb9\:6846\:6807\:7b7e\:7684\:8bbe\:7f6e\:76f4\:63a5\:653e\:5728\:8fd9\:91cc\:ff0c\:5982\:679c\:5bf9\:8f93\:51fa\:7684\:56fe\:7247\:4e0d\:6ee1\:610f\:53ef\:4ee5\:968f\:65f6\:6539\:52a8*)*)
(**)
(*images=PlotAll[data,legends,place,framelabel,97,plotrange];*)
(*plotassenble=GraphicsGrid[Partition[images,2],ImageSize->Full]*)


(* ::Input:: *)
(*PlotInOne[data,legends,{0.87,0.6},framelabel[[1]],98,plotrange[[1]]]*)


(* ::Input:: *)
(*plotwithdot[data_]:=Module[*)
(*	{j,x,withdot,l=Length[data]},*)
(*	withdot=Array[x,l];*)
(*	For[j=1,j<=l,j++,*)
(*		withdot[[j]]=*)
(*	]*)
(*]*)
(**)


(* ::Input:: *)
(*table1=Table[{i,i+RandomReal[]},{i,1,10}];*)
(*table2=Table[{i,RandomReal[]},{i,1,10}];*)
(*ListLinePlot[table1]*)
(*ListPlot[{table1,table2},PlotStyle->{Directive[Orange],Directive[Blue]},PlotMarkers->{Automatic,Medium}]*)


(* ::Input:: *)
(*\[Cross]*)


(* ::Subsection:: *)
(*\:62df\:5408\:6570\:636e\:5e76\:7ed8\:56fe*)


(* ::Subsubsection:: *)
(*\:6570\:636e\:7684\:5bfc\:5165\:4e0e\:53d8\:6362*)


(* ::Text:: *)
(*\:7531\:4e8e\:4ece\:4eea\:5668\:4e2d\:5f97\:5230\:7684\:539f\:59cb\:6570\:636e\:53ef\:80fd\:9700\:8981\:7ecf\:8fc7\:4e00\:4e9b\:53d8\:6362\:624d\:80fd\:5448\:73b0\:7ebf\:6027\:5f62\:5f0f\:ff0c\:6240\:4ee5\:6b64\:5904\:5fc5\:987b\:624b\:52a8\:64cd\:4f5c\:3002*)


(* ::Input:: *)
(*rawdata=ImportDataFitFile[path,experimentnumber];*)
(*rawdata//Length*)
(*(*\:5bfc\:5165\:539f\:59cb\:6570\:636e\:ff0c\:68c0\:67e5\:6709\:65e0\:9519\:8bef*)  *)


(* ::Input:: *)
(*rawdata=Drop[rawdata,-1]*)


(* ::Input:: *)
(*rawdata=rawdata//ToExpression;*)
(*(*\:8f6c\:5316\:4e3a\:53ef\:8ba1\:7b97\:7684\:8868\:8fbe\:5f0f*)    *)
(*datafit=Array[x,Length[rawdata]];datafit[[1]]=Table[rawdata[[1,i]],{i,Length[rawdata[[1]]]}];datafit[[2]]=Table[rawdata[[2,i]],{i,Length[rawdata[[2]]]}];datafit[[3]]=Table[rawdata[[3,i]],{i,Length[rawdata[[3]]]}];*)
(*datafit[[4]]=Table[rawdata[[4,i]],{i,Length[rawdata[[4]]]}];*)
(*(*\:6839\:636e\:5b9e\:9a8c\:7684\:7269\:7406\:610f\:4e49\:5bf9\:6a2a\:5750\:6807\:7eb5\:5750\:6807\:505a\:76f8\:5e94\:53d8\:6362\:ff0c\:4f7f\:5176\:6ee1\:8db3\:7ebf\:6027\:5173\:7cfb*)*)
(**)
(*ListPlot[datafit[[4]],PlotTheme->"Detailed",PlotRange->All]*)
(*(*\:68c0\:67e5\:6570\:636e\:70b9\:662f\:5426\:843d\:5728\:4e00\:6761\:76f4\:7ebf\:4e0a*)*)


(* ::Input:: *)
(*ExportDataFitFile[path,experimentnumber,datafit]*)
(*(*\:65b0\:5efafit_input\:6587\:4ef6\:5939\:ff0c\:5bfc\:51fa\:6807\:51c6\:5316\:540d\:79f0\:7684\:6570\:636e\:6587\:4ef6.txt\:ff0c\:65b9\:4fbf SingleLinearFit \:51fd\:6570\:76f4\:63a5\:7ed8\:56fe*)*)


(* ::Input:: *)
(*datafit*)


(* ::Subsubsection:: *)
(*\:56de\:5f52\:53ef\:89c6\:5316*)


(* ::Input:: *)
(*path*)


(* ::Input:: *)
(*linearmodel=SingleLinearFit[path,experimentnumber,x]*)


(* ::Input:: *)
(*linearmodel=Drop[linearmodel,-1];*)
(*(*\:8bfb\:5165 fit_input \:6587\:4ef6\:5939\:4e2d\:540d\:79f0\:5df2\:7ecf\:6807\:51c6\:5316\:7684\:6570\:636e\:6587\:4ef6.txt\:ff0c\:6c42\:751f\:6210\:62df\:5408\:6a21\:578b*)*)


(* ::Input:: *)
(*fitframelabel=Table[{"T / K","E / mV"},{i,1,Length[linearmodel]}];*)
(*(*fitframelabel={{"T / K","E / mV"}};*)*)
(*(*\:8f74\:6807\:7b7e*)*)
(**)
(*fitlegends=ModelLegends[linearmodel,T];*)
(*(*\:4ece\:62df\:5408\:6a21\:578b\:4e2d\:63d0\:53d6 BestFitParameters \:4ee5\:751f\:6210\:56fe\:4f8b\:3002\:9700\:8981\:8f93\:5165\:5f62\:5f0f\:81ea\:53d8\:91cf*)*)
(**)
(*dotlegends={{"\:7535\:538b\:5747\:503c"}};*)
(**)
(*fitplace=Table[{0.75,0.8},{i,1,Length[linearmodel]}] ;*)
(*(*fitplace= {{0.2, 0.85},{0.2, 0.85},{0.2, 0.85},{0.2, 0.85},{0.2, 0.85},{0.2, 0.85},{0.2, 0.85},{0.2, 0.85}};*)*)
(**)
(*legendsplace=Table[fitplace[[i]]+{-0.075,-0.1},{i,1,Length[fitplace]}];*)
(*(*\:56fe\:4f8b\:4f4d\:7f6e*)*)
(**)
(*modelvisualized=PlotLinearFit[datafit,linearmodel,fitlegends,dotlegends,fitplace,legendsplace,fitframelabel,98];*)
(*Show[modelvisualized[[1,1]],modelvisualized[[1,2]]]*)
(**)
(*(*\:7ed9\:51fa\:62df\:5408\:76f4\:7ebf\:3001\:6563\:70b9\:56fe\:3001\:6b8b\:5dee\:56fe\:3001\:76f8\:5173\:77e9\:9635*)*)


(* ::Input:: *)
(*modelvisualized[[1,3]]*)
(*dots=ListPlot[datafit[[1]],PlotLegends -> Placed[LineLegend[dotlegends[[1]], LegendFunction -> Frame], legendsplace[[1]]],PlotStyle->Directive[Orange],PlotMarkers->{Automatic,Scaled[0.025]},PlotRange->All];*)


(* ::Input:: *)
(*Show[modelvisualized[[1,1]],dots]*)


(* ::Input:: *)
(*plotex=%*)


(* ::Subsubsection::Closed:: *)
(*\:56de\:5f52\:4e0d\:786e\:5b9a\:5ea6*)


(* ::Input:: *)
(*modelnumber=1;*)
(*R=Abs[linearmodel[[modelnumber]]["CorrelationMatrix"][[1,2]]];*)
(*b=linearmodel[[modelnumber]]["BestFitParameters"][[1]];*)
(*k=linearmodel[[modelnumber]]["BestFitParameters"][[2]];*)
(*Print["\:76f8\:5173\:7cfb\:6570:",R]*)
(*Print["\:622a\:8ddd:",b]*)
(*Print["\:659c\:7387:",k]*)
(**)
(**)
(*Print["\:5404\:70b9\:6a2a\:5750\:6807:", Table[data2[[i,1]],{i,1,number}]]*)
(*Print["\:6a2a\:5750\:6807\:5e73\:65b9\:5e73\:5747\:503c\:ff1a",average=Total[Table[data2[[i,1]]^2,{i,1,number}]]/number]*)
(*s1=k*Sqrt[(1/R-1)/(number-2)];*)
(*s2=Sqrt[average]*s1;*)
(*If[number-2>20,*)
(*u2=s2*Tdistribution[[22]];*)
(*u1=s1*Tdistribution[[22]],*)
(**)
(*u2=s2*Tdistribution[[number-2]];*)
(*  u1=s1*Tdistribution[[number-2]];*)
(*]*)
(*Print["\:659c\:7387\:6807\:51c6\:5dee:",s1]*)
(*Print["\:622a\:8ddd\:6807\:51c6\:5dee:",s2]*)
(*Print["\:659c\:7387\:5c55\:4f38\:4e0d\:786e\:5b9a\:5ea6:",u1]*)
(*Print["\:622a\:8ddd\:5c55\:4f38\:4e0d\:786e\:5b9a\:5ea6:",u2]*)


(* ::Subsubsection::Closed:: *)
(*\:8bef\:5dee*)


(* ::Input:: *)
(*DeclarePackage["ErrorBarPlots`","ErrorListPlot"];*)
(*ErrorList*)


(* ::Input:: *)
(*<<ErrorBarPlots`*)


(* ::Input:: *)
(*ErrorListPlot*)


(* ::Subsubsection::Closed:: *)
(*\:975e\:7ebf\:6027\:56de\:5f52*)


(* ::Input:: *)
(*Clear[a,b,c]*)
(*model=a x^2+b x+c;*)
(*fit=FindFit[datafit,model,{a,b,c},x];*)
(*modelf=Function[{x},Evaluate[model/.fit]];*)
(*TraditionalForm[modelf]*)
(*Show[Plot[modelf[x],{x,datafit[[1,1]],datafit[[Length[datafit],1]]},PlotTheme->"Detailed"],ListPlot[datafit,PlotLabel->HoldForm[\:975e\:7ebf\:6027\:56de\:5f52],PlotTheme->"Scientific"]]*)


(* ::Input:: *)
(*FindFormula[rawdata[[3]]]*)


(* ::Subsection:: *)
(*T EX \:4ea4\:4e92*)


(* ::Subsubsection:: *)
(*\:56fe\:7247\:5bfc\:51fa*)


(* ::Text:: *)
(*\:76f4\:63a5\:7ed8\:56fe\:ff0c\:4e0d\:62df\:5408*)


(* ::Input:: *)
(*ExportJpg[path,images,experimentnumber]*)
(*Export[path<>"/Kecai_Xuan/exp"<>ToString[experimentnumber]<>"/figure/Figure_all.jpg",plotassenble];*)


(* ::Text:: *)
(*\:4ec5\:62df\:5408*)


(* ::Input:: *)
(*ExportJpg[path,{plotex},experimentnumber]*)


(* ::Text:: *)
(*\:76f4\:63a5\:7ed8\:56fe + \:7ebf\:6027\:62df\:5408*)


(* ::Input:: *)
(*(*ExportJpg[path,images,experimentnumber]*)
(*Export[path<>"/Kecai_Xuan/exp1/Figure_all.jpg",plotassenble];*)*)


(* ::Subsubsection:: *)
(*\:56fe\:7247\:5f15\:7528*)


(* ::Input:: *)
(*path*)


(* ::Input:: *)
(*imgcode="\\"<>"begin{figure}[ht]\n"<>"\t\\"<>"centering\n"<>"\t\\"<>"includegraphics[width=___"<>"\\"<>"textwidth]{___}\n"<>"\t\\"<>"caption{___}\n"<>"\t\\"<>"label{fig:___}\n"<>"\\"<>"end{figure}\n"*)


(* ::Input:: *)
(*figwidth={0.6,1,1,1,1,1,1,1};*)
(*figcaption={"\:7535\:52a8\:52bf\:4e0e\:6e29\:5ea6\:7684\:5173\:7cfb","ss","ss","ss","ss","ss","ss","ss"};*)
(*figlabel={"1","ss","ss","ss","ss","ss","ss","ss"};*)
(**)
(*ImageCode[path,experimentnumber,figwidth,figcaption,figlabel]//Column*)


(* ::Input:: *)
(*TagBox[GridBox[{{"\"\\\\begin{figure}[ht]\\\\n\\\\t\\\\centering\\\\n\\\\includegraphics[width=0.6\\\\textwidth]{Figure_1.jpg}\\\\n\\\\t\\\\caption{\:7535\:52a8\:52bf\:4e0e\:6e29\:5ea6\:7684\:5173\:7cfb}\\\\n\\\\t\\\\label{fig:1}\\\\n\\\\end{figure}\\\\n\""}},DefaultBaseStyle->"Column",GridBoxAlignment->{"Columns"->{{Left}}},GridBoxItemSize->{"Columns"->{{Automatic}},"Rows"->{{Automatic}}}],"Column"]*)


(* ::Input:: *)
(**)


(* ::Subsubsection:: *)
(*\:8868\:683c*)


(* ::Input:: *)
(*table=Table[i+j,{i,1,10},{j,0,10}];*)


(* ::Input:: *)
(*textablecode=TableCode[table]*)


(* ::Input:: *)
(*Directory[]*)



