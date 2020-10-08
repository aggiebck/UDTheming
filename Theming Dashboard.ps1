$Theme = @{
    typography = @{
      fontSize = 16
      fontFamily = "'Work Sans', sans-serif"
      fontWeightLight = 300 
      fontWeightRegular = 400
      fontWeightMedium =700
      fontFamilySecondary = "'Roboto Condensed', sans-serif"
    }
    palette = @{
        common = @{
          black = "#000"
          white = "#fff"
        }
        background = @{
          paper = "rgba(204, 204, 152, 1)"
          default = "rgba(132, 132, 108, 1)"
        }
        primary = @{
          light = "rgba(132, 132, 108, 1)"
          main = "rgba(87, 87, 65, 1)"
          dark = "rgba(46, 46, 26, 1)"
          contrastText = "#fff"
        }
        secondary = @{
          light = "rgba(255, 255, 201, 1)"
          main = "rgba(204, 204, 152, 1)"
          dark = "rgba(155, 155, 106, 1)"
          contrastText = "#fff"
        }
        error = @{
          light = "#e57373"
          main = "#f44336"
          dark = "#d32f2f"
          contrastText = "#fff"
        }
        grey = @{
          '300' = '#575741'
        }
        text = @{
          primary = "rgba(0, 0, 0, 0.87)"
          secondary = "rgba(0, 0, 0, 0.54)"
          disabled = "rgba(0, 0, 0, 0.38)"
          hint = "rgba(0, 0, 0, 0.38)"
        }
    }
  }
$Pages = @()

$Pages += New-UDPage -Name "Project-Gantt" -Content{
    $GlobalStyle ='
        #MuiPaper-root {
            padding: 5px;
            border-radius: 20px;
            background-color:rgba(0,0,0,0.5)
        }
        #cardStyleMain{
            padding: 5px;
            font-size: 22px;
            border-radius: 25px;
            text-align: center;
            background-color: rgba(204, 204, 152,0.7);
        }
        #enjoy-css {
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
            width: 100%;
            height: 100%;
            position: fixed;
            opacity: 0.98;
            overflow: auto;
            border: none;
            color: black;
            -o-text-overflow: ellipsis;
            text-overflow: ellipsis;
            background: -webkit-linear-gradient(0deg, rgba(0,0,0,0) 0, rgba(0,0,0,1) 100%), url("./logo/US_Army_Cyber_Command_SSI.png"), -webkit-linear-gradient(-180deg, rgba(0,0,0,0) 0, rgba(0,0,0,1) 100%);
            background: -moz-linear-gradient(90deg, rgba(0,0,0,0) 0, rgba(0,0,0,1) 100%), url("./logo/US_Army_Cyber_Command_SSI.png"), -moz-linear-gradient(270deg, rgba(0,0,0,0) 0, rgba(0,0,0,1) 100%);
            background: linear-gradient(90deg, rgba(0,0,0,0) 0, rgba(0,0,0,1) 100%), url("./logo/US_Army_Cyber_Command_SSI.png"), linear-gradient(270deg, rgba(0,0,0,0) 0, rgba(0,0,0,1) 100%);
            background-repeat: repeat, no-repeat, repeat;
            background-position: 50% 50%;
            -webkit-background-origin: padding-box;
            background-origin: padding-box;
            -webkit-background-clip: border-box;
            background-clip: border-box;
            -webkit-background-size: auto auto, 50% auto, auto auto;
            background-size: auto auto, 50% auto, auto auto;
            margin-left: -25px
        }
        #logoImage{
            max-width: auto;
            max-height: auto;
            display: block;
            margin-left: -5%;
            }
        '
        
    $Drawer = New-UDDrawer -Children {
        New-UDList -Children {
            New-UDListItem -Label "Gantt-Chart" -OnClick {Invoke-UDRedirect http://localhost:5000/Theme/Project-Gantt}
            New-UDListItem -Label "OPS Dashboard" -OnClick {Invoke-UDRedirect http://localhost:5000/Dev_Dashboard/OPS-Dashboard}
        }
    }
    New-UDAppBar -Position fixed -Children {
        New-UDGrid -Container -Content{
            New-UDGrid -Item -ExtraSmallSize 1 -Content{
                New-UDStyle -Style $GlobalStyle -Content{
                    New-UDImage -Id "logoImage" -Path "C:\Scripting\UD_Logos\applogo2.png" #Needs to be small enough to fit the appbar otherwise mess with #logoImage in the GlobalStyle to adjust size
                }
            }
            New-UDGrid -Item -ExtraSmallSize 11 -Content{
                New-UDElement -Id "logoText" -Tag 'h1' -Content {"Project Gantt"} 
            }
        }   
    } -Drawer $Drawer 
    New-UDStyle -Style $GlobalStyle -Content {
        New-UDElement -Id "enjoy-css" -Tag 'div' -Content {
            New-UDGrid -Spacing 3 -Container -Content {
                New-UDGrid -Item -ExtraSmallSize 3 -Content {
                    New-UDButton -Size large -FullWidth -Variant 'contained' -Icon (New-UDIcon -Icon home) -Text "Home" -OnClick {
                        Show-UDToast -Message "Link to different Page!"
                        #Invoke-UDRedirect http://localhost:5000/Dev_Dashboard/Home
                        }
                }
                New-UDGrid -Item -ExtraSmallSize 3 -Content {
                    New-UDButton -Size large -FullWidth -Variant 'contained' -Icon (New-UDIcon -Icon shield) -Text "SEC Dashboard" -OnClick {
                        Show-UDToast -Message "Link to different Page!"
                        #Invoke-UDRedirect http://localhost:5000/Dev_Dashboard/CyberSec-Dashboard
                    }
                }
                New-UDGrid -Item -ExtraSmallSize 3 -Content {
                    New-UDButton -Size large -FullWidth -Variant 'contained' -Icon (New-UDIcon -Icon network) -Text "NOC Dashboard" -OnClick {
                        #Invoke-UDRedirect http://localhost:5000/Dev_Dashboard/Noc-Dashboard
                        Show-UDToast -Message "Link to different Page!"
                    }
                }
                New-UDGrid -Item -ExtraSmallSize 3 -Content {
                    New-UDButton -Size large -FullWidth -Variant 'contained' -Icon (New-UDIcon -Icon server) -Text "OPS Dashboard" -OnClick {
                        Show-UDToast -Message "Link to different Page!"
                        #Invoke-UDRedirect http://localhost:5000/Dev_Dashboard/OPS-Dashboard
                    }
                }
            }
            New-UDGrid -Container -Spacing 3 -Content{
                New-UDGrid -Item -ExtraSmallSize 6 -Content{
                    New-UDGrid -Container -Spacing 3 -Content{
                        New-UDPaper -Id "MuiPaper-root" -Content {
                            New-UDCard -Id "cardStyleMain" -Content{
                                New-UDGrid -Item -ExtraSmallSize 12 -Content{
                                    New-UDGrid -Container -Content{
                                        New-UDGrid -Item -ExtraSmallSize 12 -Content{
                                            New-UDTypography -Variant "subtitle1" -Text "Initial Development Cycle - 12 Month Implementation Plan " -Align center 
                                        }
                                        New-UDGrid -Item -ExtraSmallSize 12 -Content{
                                            $DataArray = @()
                                            $DataLabels = @("Research","Development","Testing","Deploy")
                                            $DataValues = @(4,7,3,1)
                                            for ($i = 0; $i -lt $DataLabels.Count; $i++) {
                                                $line = "" | select label,value
                                                $line.label = $DataLabels[$i]
                                                $line.value = $DataValues[$i]
                                                $DataArray += $line
                                            }
                                            $Options = @{
                                                Type = 'pie'
                                                Data = $DataArray
                                                BackgroundColor = @('#dc4437','#6196f6','#f3a600','#109d58')
                                                DataProperty = 'value'
                                                LabelProperty = 'label'
                                                
                                            }
                                            New-UDChartJS @Options 
                                        }
                                    }

                                }
                            }
                            New-UDGrid -Item -ExtraSmallSize 8 -Content{
                                New-UDCard -Id "cardStyleMain" -Content{
                                    New-UDList -SubHeader "Initital Development Cycle - Dates" -Content {
                                        New-UDListItem  -Label 'Research - 4 Month' -Icon (New-UDIcon -Icon angle_right -Size 2x) -Subtitle 'Dec 2020 - Feb 2021' -Children{
                                            New-UDListItem  -Label 'Research Application Security Settings' -Icon (New-UDIcon -Icon angle_right -Size sm) -SubTitle 'Dec 2020 - Jan 2021'
                                            New-UDListItem  -Label 'Research Initial Toolsets' -Icon (New-UDIcon -Icon angle_right -Size sm) -SubTitle 'Dec 2020 - Feb 2021'
                                        }
                                        New-UDListItem  -Label 'Development - 7 Months' -Icon (New-UDIcon -Icon angle_right -Size 2x) -Subtitle 'Jan 2021 - May 2021' -Children{
                                            New-UDListItem  -Label 'Framework Development' -Icon (New-UDIcon -Icon angle_right -Size sm) -SubTitle 'Oct-2020 - Jan 2021'
                                            New-UDListItem  -Label 'Code Development' -Icon (New-UDIcon -Icon angle_right -Size sm) -SubTitle 'Jan 2021 - Apr 2021'
                                            New-UDListItem  -Label 'Development Deploy' -Icon (New-UDIcon -Icon angle_right -Size sm) -SubTitle 'Feb 2021 - May 2021'
                                        }
                                        New-UDListItem  -Label 'Testing - 3 Month' -Icon (New-UDIcon -Icon angle_right -Size 2x) -Subtitle 'May 2021 - Aug 2021'
                                        New-UDListItem  -Label 'Deploy - 1 Month' -Icon (New-UDIcon -Icon angle_right -Size 2x) -Subtitle 'Aug 2021 - Sept 2021'
                                    }    
                                }
                            }
                        } -Elevation 20
                        New-UDGrid -Item -ExtraSmallSize 12 -Content{
                            New-UDGantt -Id "InitialGantt" -CriticalPathEnabled $false -CriticalStrokeColor '#ccc' -GridStrokeWidth 15 -Width "100%" -Height "335px" -InnerGrid "#e0e0e0" -InnerGridDark "#dad3c1"  -Data {
                                New-UDGanttData -TaskID "Build" -TaskName "Framework Development" -Start (Get-Date) -Resource 'research' -End (Get-Date).AddMonths(3) -PercentComplete 35
                                New-UDGanttData -TaskID "Security" -TaskName "Research Application Security Settings" -Start (Get-Date).AddMonths(2) -End (Get-Date).AddMonths(3) -PercentComplete 0
                                New-UDGanttData -TaskID "Research" -TaskName "Research Initial Toolsets" -Start (Get-Date).AddMonths(2) -End (Get-Date).AddMonths(4) -PercentComplete 0
                                New-UDGanttData -TaskID "Write" -TaskName "Develop Toolset Code" -Resource "research" -Start (Get-Date).AddMonths(3) -End (Get-Date).AddMonths(6)  -Duration (1 * 24 * 60 * 60 * 1000) -PercentComplete 0
                                New-UDGanttData -TaskID "Development" -TaskName "Deploy Code to Development Environment" -Resource "research" -Start (Get-Date).AddMonths(4) -End (Get-Date).AddMonths(7) -Duration (1 * 24 * 60 * 60 * 1000) -PercentComplete 0 
                                New-UDGanttData -TaskID "Test" -TaskName "Test Toolsets" -Resource "Development" -Start (Get-Date).AddMonths(7) -End (Get-Date).AddMonths(10) -Duration (1 * 24 * 60 * 60 * 1000) -PercentComplete 0 
                                New-UDGanttData -TaskID "Deploy" -TaskName "Deploy Toolsets to Production" -Resource "test" -Start (Get-Date).AddMonths(10) -End (Get-Date).AddMonths(11) -Duration (1 * 24 * 60 * 60 * 1000) -PercentComplete 0 
                            } 
                        }
                    }
                }
                New-UDGrid -Item -ExtraSmallSize 6 -Content{
                    New-UDGrid -Container -Spacing 3 -Content{
                        New-UDPaper -Id "MuiPaper-root" -Content {
                            New-UDCard -Id "cardStyleMain" -Content{
                                New-UDGrid -Item -ExtraSmallSize 12 -Content{
                                    New-UDGrid -Container -Content{
                                        New-UDGrid -Item -ExtraSmallSize 12 -Content{
                                            New-UDTypography -Variant "subtitle1" -Text "Iterative Development Cycle - 149 Day Turnaround" -Align center 
                                        }
                                        New-UDGrid -Item -ExtraSmallSize 12 -Content{
                                            $DataArray = @()
                                            $DataLabels = @("Research","Development","Testing","Deploy")
                                            $DataValues = @(30,60,45,12)
                                            for ($i = 0; $i -lt $DataLabels.Count; $i++) {
                                                $line = "" | select label,value
                                                $line.label = $DataLabels[$i]
                                                $line.value = $DataValues[$i]
                                                $DataArray += $line
                                            }
                                            $Options = @{
                                                Type = 'pie'
                                                Data = $DataArray
                                                BackgroundColor = @('#6196f6','#dc4437','#f3a600','#109d58')
                                                DataProperty = 'value'
                                                LabelProperty = 'label'
                                            }
                                            New-UDChartJS @Options
                                        }
                                    }
                                }
                            }
                            New-UDGrid -Item -ExtraSmallSize 8 -Content{
                                New-UDCard -Id "cardStyleMain" -Content{ 
                                    New-UDList -SubHeader 'Iterative Development Cycle - Dates' -Content {
                                        New-UDListItem -Label 'Research - 30 Days' -Icon (New-UDIcon -Icon angle_right -Size 2x) -Subtitle 'Sept 6 - Oct 6, 2021'
                                        New-UDListItem -Label 'Development - 60 Days' -Icon (New-UDIcon -Icon angle_right -Size 2x) -Subtitle 'Sept 21 - Nov 19, 2021' -Children{
                                            New-UDListItem -Label 'Develop Code - 60 Days' -Icon (New-UDIcon -Icon angle_right -Size sm) -Subtitle 'Sept 21 - Nov 19, 2021'
                                            New-UDListItem -Label 'Deploy Code - 45 Days' -Icon (New-UDIcon -Icon angle_right -Size sm) -Subtitle 'Oct 6 - Nov 19, 2021'
            
                                        }
                                        New-UDListItem -Label 'Testing - 45 Days' -Icon (New-UDIcon -Icon angle_right -Size 2x) -Subtitle 'Oct 6 - Nov 19, 2021'
                                        New-UDListItem -Label 'Deploy to Production - 14 Day' -Icon (New-UDIcon -Icon angle_right -Size 2x) -Subtitle 'Dec 19, 2021 - Jan 2, 2022'
                                    }
                                }
                            }
                        } -Elevation 20
                        New-UDGrid -Item -ExtraSmallSize 12 -Content{
                            New-UDGantt -Id "IterativeGantt" -CriticalPathEnabled $false -CriticalStrokeColor '#e64a19' -GridStrokeWidth 1 -CriticalStrokeWidth 4 -GridStrokeColor "#ccc" -Width "100%" -Height "270px" -InnerGrid "#e0e0e0" -InnerGridDark "#dad3c1"  -Data {
                                $ResearchStartDate = (Get-Date).AddMonths(11)
                                $ResearchEndDate = $ResearchStartDate.AddDays(30)
                                New-UDGanttData -TaskID "Research" -TaskName "Research Additional Toolset" -Start $ResearchStartDate -End $ResearchEndDate -PercentComplete 0
        
                                $WriteStartDate = $ResearchStartDate.AddDays(15)
                                $WriteEndDate = $ResearchEndDate.AddDays(44)
                                New-UDGanttData -TaskID "Write" -TaskName "Develop Toolset Code" -Resource "research" -Start $WriteStartDate -End $WriteEndDate  -Duration (1 * 24 * 60 * 60 * 1000) -PercentComplete 0 
        
                                $DevStartDate = $WriteStartDate.AddDays(15)
                                $DevEndDate = $ResearchEndDate.AddDays(44)
                                New-UDGanttData -TaskID "Development" -TaskName "Deploy Code to Development Environment" -Resource "research" -Start $DevStartDate -End $DevEndDate -Duration (1 * 24 * 60 * 60 * 1000) -PercentComplete 0 
        
                                $TestStartDate = $DevStartDate.AddDays(30)
                                $TestEndDate = $DevEndDate.AddDays(30)
                                New-UDGanttData -TaskID "Test" -TaskName "Test Toolset" -Resource "Development" -Start $TestStartDate -End $TestEndDate -Duration (1 * 24 * 60 * 60 * 1000) -PercentComplete 0 
                                New-UDGanttData -TaskID "Deploy" -TaskName "Deploy Toolset to Production" -Resource "test" -Start $TestEndDate -End $TestEndDate.AddDays(14) -Duration (1 * 24 * 60 * 60 * 1000) -PercentComplete 0 
                            }
                        }
                    }
                }
            }            
        }
    } 
}

$Pages += New-UDPage -Name 'OPS Dashboard' -Content{
    $GlobalStyle ='
        #MuiPaper-root {
            padding: 5px;
            border-radius: 20px;
            background-color:rgba(0,0,0,0.5)
        }
        #cardStyleMain{
            padding: 5px;
            font-size: 20px;
            border-radius: 25px;
            text-align: center;
            background-color: rgba(204, 204, 152, 0.7);
        }
        #IncardStyleMain{
            padding: 5px;
            font-size: 22px;
            border-radius: 25px;
            text-align: center;
            background-color: rgba(49,49,49,0.7);
        }
        #enjoy-css {
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
            width: 100%;
            height: 100%;
            position: fixed;
            opacity: 0.98;
            overflow: auto;
            border: none;
            color: black;
            -o-text-overflow: ellipsis;
            text-overflow: ellipsis;
            background: -webkit-linear-gradient(0deg, rgba(0,0,0,0) 0, rgba(0,0,0,1) 100%), url("https://enjoycss.com/bg-img/custom/8795-1bvlibh.ax9h.png"), -webkit-linear-gradient(-180deg, rgba(0,0,0,0) 0, rgba(0,0,0,1) 100%);
            background: -moz-linear-gradient(90deg, rgba(0,0,0,0) 0, rgba(0,0,0,1) 100%), url("https://enjoycss.com/bg-img/custom/8795-1bvlibh.ax9h.png"), -moz-linear-gradient(270deg, rgba(0,0,0,0) 0, rgba(0,0,0,1) 100%);
            background: linear-gradient(90deg, rgba(0,0,0,0) 0, rgba(0,0,0,1) 100%), url("https://enjoycss.com/bg-img/custom/8795-1bvlibh.ax9h.png"), linear-gradient(270deg, rgba(0,0,0,0) 0, rgba(0,0,0,1) 100%);
            background-repeat: repeat, no-repeat, repeat;
            background-position: 50% 50%;
            -webkit-background-origin: padding-box;
            background-origin: padding-box;
            -webkit-background-clip: border-box;
            background-clip: border-box;
            -webkit-background-size: auto auto, 50% auto, auto auto;
            background-size: auto auto, 50% auto, auto auto;
            margin-left: -25px
        }
        #logoImage{
            max-width: auto;
            max-height: auto;
            display: block;
            margin-left: -5%;
        }'

        
    $Drawer = New-UDDrawer -Children {
        New-UDList -Children {
            New-UDListItem -Label "Gantt Charts" -OnClick {Invoke-UDRedirect http://localhost:5000/Theme/Project-Gantt}
            New-UDListItem -Label "OPS Dashboard" -OnClick {Invoke-UDRedirect http://localhost:5000/Theme/OPS-Dashboard}

        }
    }
    New-UDAppBar -Position fixed -Children {
        New-UDGrid -Container -Content{
            New-UDGrid -Item -ExtraSmallSize 1 -Content{
                New-UDStyle -Style $GlobalStyle -Content{
                    New-UDImage -Id "logoImage" -Path "C:\Scripting\UD_Logos\applogo2.png"
                }
            }
            New-UDGrid -Item -ExtraSmallSize 11 -Content{
                New-UDElement -Id "logoText" -Tag 'h1' -Content {"Army Cyber Command - Operations"} 
            }
        }   
    } -Drawer $Drawer
    New-UDStyle -Style $GlobalStyle -Content{
        New-UDElement -Id "enjoy-css" -Tag 'div' -Content{
            New-UDGrid -Spacing 1 -Container -Content {
                New-UDGrid -Item -ExtraSmallSize 4 -Content {
                    New-UDButton -Size large -FullWidth -Variant 'contained' -Icon (New-UDIcon -Icon home) -Text "Home" -OnClick {
                        Show-UDToast -Message "Link to different Page!"
                        #Invoke-UDRedirect http://localhost:5000/Dev_Dashboard/Home
                        }
                }
                New-UDGrid -Item -ExtraSmallSize 4 -Content {
                    New-UDButton -Size large -FullWidth -Variant 'contained' -Icon (New-UDIcon -Icon shield) -Text "SEC Dashboard" -OnClick {
                        Show-UDToast -Message "Link to different Page!"
                        #Invoke-UDRedirect http://localhost:5000/Dev_Dashboard/CyberSec-Dashboard
                    }
                }
                New-UDGrid -Item -ExtraSmallSize 4 -Content {
                    New-UDButton -Size large -FullWidth -Variant 'contained' -Icon (New-UDIcon -Icon network) -Text "NOC Dashboard" -OnClick {
                        Show-UDToast -Message "Link to different Page!"
                        #Invoke-UDRedirect http://localhost:5000/Dev_Dashboard/Noc-Dashboard
                    }
                }
            }
            New-UDGrid -Spacing 1 -Container -Content{
                New-UDGrid -Item -ExtraSmallSize 4 -Content{
                    New-UDPaper -Id "MuiPaper-root" -Content {
                            New-UDCard -Id "IncardStyleMain" -Title 'Input Example 1' -Content {
                                "Sample Text"
                            }       
                        } -Elevation 2
                    } 
                New-UDGrid -Item -ExtraSmallSize 4 -Content{
                    New-UDPaper -Id "MuiPaper-root" -Content {
                        New-UDCard -Id "cardStyleMain" -Title 'OPS Dashboard Explained' -Content {
                            "OPS Dashboard Discussion will go here Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam imperdiet, sem in imperdiet aliquam, sem augue imperdiet dui, id gravida metus lectus non dolor. Etiam diam leo, accumsan eu tristique ac, eleifend ac nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Pellentesque tristique, metus. "
                        }
                    } -Elevation 2
                }
                New-UDGrid -Item -ExtraSmallSize 4 -Content{
                    New-UDPaper -Id "MuiPaper-root" -Content {
                        New-UDCard -Id "IncardStyleMain" -Title 'Input Example 2' -Content {
                            "Sample Text"
                        }
                    } -Elevation 2
                }
                New-UDGrid -Item -ExtraSmallSize 12 -Content{
                    New-UDPaper -Id "MuiPaper-root" -Content {
                            New-UDCard -Id "cardStyleMain" -Title 'Operational Toolsets' -Content {
                                "Showcase Ops Tools here with Discussion. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam imperdiet, sem in imperdiet aliquam, sem augue imperdiet dui, id gravida metus lectus non dolor. Etiam diam leo, accumsan eu tristique ac, eleifend ac nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Pellentesque tristique, metus. "
                            }

                    } -Elevation 2
                }
            } 
        }
    }
}

New-UDDashboard -Theme $Theme -Title "Theme-Testing" -Pages $Pages