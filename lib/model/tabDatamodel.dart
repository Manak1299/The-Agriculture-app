class TabData {
  String name ="";
  String value ="";

  TabData(this.name,this.value);

  static  List<TabData> dummy_data_list() {
    List<TabData> dummy_data = List();
    dummy_data.add(TabData( "Discharge at:","7350 LPM"));
    dummy_data.add(TabData(  "Head:","600 m"));
    dummy_data.add(TabData( "","dummy_data_list@gmail.com"));
    dummy_data.add(TabData( "", "Maximum Flow: 440 meter cube/hour"));
    return dummy_data;
  }
  static  List<TabData> dummy_list() {
    List<TabData> dummy_data = List();
    dummy_data.add(TabData("Power Range "," 0.37 kW to 1.1 kW (0.50 HP to 1.5HP)"));
    dummy_data.add(TabData("Speed "," 2880 RPM"));
    dummy_data.add(TabData("Version "," Single Phase 160V to 230V, 50Hz, AC Supply"));
    dummy_data.add(TabData("Head Range "," 14 Mtr. to 96 Mtr."));
    dummy_data.add(TabData("Discharge Range "," 70 LPM to 15 LPM"));
    dummy_data.add(TabData("Outlet Size in Inch "," 1.25”"));
    dummy_data.add(TabData("Head Range  ","14 Mtr. to 96 Mtr."));
    dummy_data.add(TabData("Discharge Range "," 70 LPM to 15 LPM"));
    dummy_data.add(TabData("Outlet Size in Inch "," 1.25”"));
    dummy_data.add(TabData("Degree of Protection "," IP 58"));
    dummy_data.add(TabData("Direction of Rotation "," Counter clockwise from driving end -1 pH"));
    dummy_data.add(TabData("flow along the motor "," 0.15 m/sec."));
    dummy_data.add(TabData("Type of duty "," S1 (continues)"));
    dummy_data.add(TabData("Method of starting "," 1ph-Capacitor"));
    dummy_data.add(TabData("Maximum starts per hour "," 20 times"));
    return dummy_data;
  }

  static  List<TabData> application_list() {
    List<TabData> dummy_data = List();
    dummy_data.add(TabData("","Domestic and municipal water supply "));
    dummy_data.add(TabData("","Firefighting system"));
    dummy_data.add(TabData("","Rural water supply"));
    dummy_data.add(TabData("","Industrial and mining application"));
    dummy_data.add(TabData("","Sprinkler system"));
    dummy_data.add(TabData("","Fountains"));
    dummy_data.add(TabData("","Pressure boosting units"));
    dummy_data.add(TabData("","Gardens"));
    return dummy_data;
  }
}