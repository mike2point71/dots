BEGIN {
    foundName=false;
    BoldBrightWhite="\033[97;1m";
    BoldBrightGreen="\033[92;1m";
    Plain="\033[0m";
    pieces["nothing"] = "whatever";
    # sectionMap["PreOpen"] = ;
    # sectionMap["Analytics"] = 0;
    # sectionMap["Caveats"] = 0;
    # sectionMap["Options"] = false;
    # sectionMap["Dependencies"] = true;
    # sectionMap["Open"] = true;
    onSection = "PreOpen";
    openCount=0;
    # description="";
    url="";
}



function colorLine(colorVar){
    printf("%s%s%s\n", colorVar, $0, Plain);
}

function preOpen() {
    if ($1 ~ appname) {
        printf "%s", appname;
        onSection = "Open";
    }
}

function open(){
    # printf("Hittin open...%s", openCount);

    switch(openCount) {
        case 0:
            # print("opencount0");
            printf "@@@ %s%s%s", BoldBrightWhite, $0, Plain;
            # pieces["descripion"]=$0;
            break;
        case 1:
            # url=$0;
            printf "@@@ %s\n", $0;
            # exit 0;
        default:
            break;
        
    }
    openCount+=1;

}

function doLine(){
    switch (onSection) {
        case "PreOpen":
            preOpen();
            break;
        case "Open":
            open();
            break;
        default:
            break;
    }
}

/./ { doLine(); }

    # if($1 != "formulae" && $1 != "casks"){}
    
    # if($1 ~ "==>") {
    #     # printf("%s", $BoldBrightWhite);
    #     # printf("%s", "$0");
    #     # printf("%s", $Plain);
    #     # printf("\n");
    #     colorLine(BoldBrightWhite);
    # } else {
    #     print($0);
    # }

    
    # if(sectionMap[onSection]){

    # }
    
    # if ($foundName == true){
        
    # } else {
    #     if ($1 ~ $appname) {
    #         foundName=true;
    #         # printf("%s", $BoldBrightGreen);
    #         # printf("%s", "$0");
    #         # printf("%s", $Plain);
    #         # printf("\n");
    #         colorLine(BoldBrightGreen);
    #     }
    # }
# }




END {
    # print("----\n");
}