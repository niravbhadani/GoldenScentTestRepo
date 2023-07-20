//
//  DashboardViewController.swift
//  GoldenScentTest
//
//  Created by Nirav Bhadani on 20/07/23.
//

import UIKit

let jsonResponse = """
        {
           "rows":[
              {
                 "row-margin-left":"0px",
                 "row-margin-right":"0px",
                 "row-marginbottom":"5px",
                 "columns":[
                    {
                       "type":"image",
                       "src":"https://picsum.photos/300/200"
                    }
                 ]
              },
              {
                 "row-margin-bottom":"10px",
                 "row-margin-right":"0px",
                 "row-margin-left":"0px",
                 "height":"328px",
                 "columns":[
                    {
                       "type":"custom-slider",
                       "slides":[
                          {
                             "type":"image",
                             "src":"https://picsum.photos/300/200"
                          },
                          {
                             "type":"image",
                             "src":"https://picsum.photos/300/200"
                          },
                          {
                             "type":"image",
                             "src":"https://picsum.photos/300/200"
                          },
                          {
                             "type":"image",
                             "src":"https://picsum.photos/300/200"
                          }
                       ]
                    }
                 ]
              },
              {
                 "row-margin-left":"0px",
                 "row-margin-right":"0px",
                 "columns":[
                    {
                       "type":"image",
                       "src":"https://picsum.photos/300/200"
                    }
                 ]
              },
              {
                 "row-margin-left":"15px",
                 "row-margin-right":"20px",
                 "row-margin-bottom":"20px",
                 "columns":[
                    {
                       "type":"text",
                       "content":"DISCOVERMORE",
                       "text-align":"left",
                       "font-color":"#000000",
                       "font-size":"20",
                       "font":"Gilroy-Bold"
                    }
                 ]
              },
              {
                 "columns":[
                    {
                       "type":"image",
                       "src":"https://picsum.photos/300/200"
                    },
                    {
                       "type":"image",
                       "src":"https://picsum.photos/300/200"
                    },
                    {
                       "type":"image",
                       "src":"https://picsum.photos/300/200"
                    }
                 ],
                 "row-margin-left":"20px",
                 "row-margin-right":"20px",
                 "row-margin-bottom":"10px"
              },
              {
                 "row-margin-bottom":"10px",
                 "columns":[
                    {
                       "type":"text",
                       "background":{
                          "color":"#ffffff"
                       },
                       "font-color":"#000000",
                       "font-size":"12",
                       "font":"Gilroy-Bold",
                       "content":"Makeup"
                    },
                    {
                       "type":"text",
                       "font-color":"#000000",
                       "font-size":"12",
                       "font":"Gilroy-Bold",
                       "content":"Skincare",
                       "background":{
                          "color":"#ffffff"
                       }
                    },
                    {
                       "type":"text",
                       "font-color":"#000000",
                       "font-size":"12",
                       "font":"Gilroy-Bold",
                       "content":"Hair &Body",
                       "background":{
                          "color":"#ffffff"
                       }
                    }
                 ],
                 "row-margin-left":"15px",
                 "row-margin-right":"15px"
              }
           ]
        }
        """


class DashboardViewController: UIViewController {
    
    
    //MARK: Outlets
    @IBOutlet weak var tableView: UITableView!
    
    
    //MARK: Variables
    private let tableViewModel = DashboardTableViewModel(jsonString: jsonResponse)
    
    
    //MARK: Initial Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
}
