(* ::Package:: *)

BeginPackage["Fitting`"]

Unprotect @@ Names["Fitting`*"];

ClearAll @@ Names["Fitting`*"];

ImportDataFitFile::usage = "input the main path and experiment number, please formalize the import txt.\n
ImportDataFile[path,n]"

ExportDataFitFile::usage = "ExportDataFitFile[localpath_,number_,datafit_]"

SingleLinearFit::usage = "Read the data files to be fitted with a linear model, take their LinearModelFit as its result.\n
Before applying this function, please create a new folder named fit_input in your original data folder and formalize them.\n
SingleLinearFit[localpath_,number_,x_]"

PlotLinearFit::usage = "PlotLinearFit[datafit_,models_,legends_,place_,framelabel_,color_]"

ModelLegends::usage = "ModelLegends[models_,x_]"


Begin["`Private`"]

ImportDataFitFile[localpath_, number_] :=
    Module[{names, filelength, datain, y, j},
        SetDirectory[localpath <> "/Kecai_Xuan/exp" <> ToString[number
            ] <> "/PB20030874_Kecai_Xuan_data_for_exp" <> ToString[number] <> "/rawfit_input"
            ];
        names = FileNames[];
        filelength = Length[names];
        datain = Array[y, filelength];
        For[j = 1, j <= filelength, j++,
            datain[[j]] = Import[ToString[j] <> ".txt", "Table"];
        ];
        SetDirectory[localpath];
        datain
    ]

ExportDataFitFile[localpath_, number_, datafit_] :=
    Module[{j, l = Length[datafit]},
        For[j = 1, j <= l, j++,
            Export[localpath <> "/Kecai_Xuan/exp" <> ToString[number]
                 <> "/PB20030874_Kecai_Xuan_data_for_exp" <> ToString[number] <> "/fit_input/"
                 <> ToString[j] <> ".txt", datafit[[j]], "Table"];
        ]
    ]

SingleLinearFit[localpath_, number_, x_] :=
    Module[{names, y, datafit, filelength, j, linearmodel},
        SetDirectory[localpath <> "/Kecai_Xuan/exp" <> ToString[number
            ] <> "/PB20030874_Kecai_Xuan_data_for_exp" <> ToString[number] <> "/fit_input"
            ];
        names = FileNames[];
        filelength = Length[names];
        linearmodel = datafit = Array[y, filelength];
        For[j = 1, j <= filelength, j++,
            datafit[[j]] = Import[ToString[j] <> ".txt", "Table"]; 
            linearmodel[[j]] = LinearModelFit[datafit[[j]], x, x]
        ];
        SetDirectory[localpath];
        linearmodel
    ]

fitmodelplot = Plot[#2[x], {x, #1[[1, 1]], #1[[Length[#1], 1]]}, PlotRange
     -> Full, Frame -> True, LabelStyle -> Directive[Black], GridLines ->
     Automatic, PlotLegends -> Placed[LineLegend[#3, LegendFunction -> Frame
    ], #4], FrameLabel -> #5, PlotStyle -> #6, ImageSize -> Large]&;

PlotLinearFit[datafit_, models_, fitlegends_, dotlegends_, fitplace_,
     dotplace_, framelabel_, colordatanumber_] :=
    Module[{x, y, l = Length[models], dotplot, modelplot, output, j},
        
        output = Array[y, {l, 4}];
        For[j = 1, j <= l, j++,
            output[[j, 1]] = fitmodelplot[datafit[[j]], models[[j]], 
                fitlegends[[j]], fitplace[[j]], framelabel[[j]], ColorData[colordatanumber,
                 "ColorList"][[j]]]; output[[j, 2]] = ListPlot[datafit[[j]], PlotStyle
                 -> Directive[ColorData[colordatanumber, "ColorList"][[j + 1]], PointSize
                 -> 0.015], PlotLegends -> Placed[LineLegend[dotlegends[[j]], LegendFunction
                 -> Frame], dotplace[[j]]]]; output[[j, 3]] = ListPlot[models[[j]]["FitResiduals"
                ], Frame -> True, PlotRange -> All, FrameLabel -> {"serial number", framelabel
                [[j, 2]]}, PlotStyle -> Directive[PointSize -> 0.015], PlotTheme -> "Scientific"
                ]; output[[j, 4]] = models[[j]]["CorrelationMatrix"];
        ];
        output
    ]

ModelLegends[models_, x_] :=
    Module[{j, legends, l = Length[models]},
        legends = Array[m, l];
        For[j = 1, j <= l, j++,
            legends[[j]] = {ToString[DecimalForm[models[[j]]["BestFitParameters"
                ][[1]]]] <> " + " <> ToString[DecimalForm[models[[j]]["BestFitParameters"
                ][[2]]]] <> " " <> ToString[x]};
        ];
        legends
    ]


End[]

EndPackage[]
