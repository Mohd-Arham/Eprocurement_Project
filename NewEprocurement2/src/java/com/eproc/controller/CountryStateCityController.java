/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eproc.controller;

import com.eproc.daoImpl.CitiesDAOImpl;
import com.eproc.daoImpl.CountriesDAOImpl;
import com.eproc.daoImpl.StatesDAOImpl;
import com.eproc.domain.Cities;
import com.eproc.domain.Countries;
import com.eproc.domain.Logs;
import com.eproc.domain.States;
import com.eproc.logs.LogsAction;
import com.eproc.logs.LogsActionDao;
import com.eproc.model.CitiesModel;
import com.eproc.model.CountriesModel;
import com.eproc.model.StatesModel;
import com.google.gson.Gson;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 *
 * @author Shashank Shukla
 */
@Controller
public class CountryStateCityController {

    @Autowired
    CountriesDAOImpl countriesDao;

    @Autowired
    StatesDAOImpl statesDaoImpl;

    @Autowired
    CitiesDAOImpl citiesDaoImpl;

    @Autowired
    LogsAction logsAction;

    @Autowired
    LogsActionDao logsActionDao;

    @Autowired
    CountriesModel countriesModel;

    StatesModel statesModel = new StatesModel();
    CitiesModel citiesModel = new CitiesModel();
    Gson gson = new Gson();

//    @InitBinder("countries")
//    protected void initCountryBinder(WebDataBinder binder) {
//        System.out.println("Call initBinder Method");
//        binder.setValidator(new CountriesModel());
//    }
//    @InitBinder("state")
//    protected void initStateBinder(WebDataBinder binder) {
//        System.out.println("Call initBinder Method");
//        binder.setValidator(new StatesModel());
//    }
//    @InitBinder("cities")
//    protected void initCitiesBinder(WebDataBinder binder) {
//        System.out.println("Call initBinder Method");
//        binder.setValidator(new CitiesModel());
//    }
    //Redirect Page
    //first page
    /*
     *This Method is show the first page  .
     */
    @RequestMapping("/country_state_city")
    public String welcome(Model m, @ModelAttribute("countries") Countries countries, @ModelAttribute("state") States state, @ModelAttribute("cities") Cities cities) {
        System.out.println("----------------Method Start to call the country_state_city Controller----------------------");

        try {
            List<Countries> countryList = countriesDao.fetchAll();
            m.addAttribute("countryList", countryList);
        } catch (Exception ex) {
            System.out.println("Class:countrystatecityController\n Method:welcome");
            System.out.println("Exception in countrystatecityController " + ex.getMessage());
            ex.printStackTrace();
        }
        return "DepartmentAdmin/CountryStateCity";
    }

    //fetch All Countries
    /*
     *This Method is uses for fetch All Countries .
     */
    @RequestMapping("/AllCountries")
    public String allCountries(Model m, @ModelAttribute("countries") Countries countries) {
        System.out.println("----------------Method call to allcountrys in country_state_cityController----------------------");

        try {
            List<Countries> countryList = countriesDao.fetchAll();
            m.addAttribute("countryList", countryList);
            m.addAttribute("msg1", "List of all Countries");
        } catch (Exception ex) {
            System.out.println("Class:countryClass\n Method:allCountries");
            System.out.println("Exception in countryClass " + ex.getMessage());
            ex.printStackTrace();
        }
        return "DepartmentAdmin/viewAlldetails";
    }

    //fetch All States
    /*
     *This Method is uses for fetch All States .
     */
    @RequestMapping("/AllStates")
    public String allStates(Model m, @ModelAttribute("state") States state) {
        System.out.println("----------------Method begin to call all states in  country-state-city Controller----------------------");

        try {
            List<States> stateList = statesDaoImpl.fetchAll();
            m.addAttribute("stateList", stateList);
            m.addAttribute("msg2", "List of all States");
        } catch (Exception ex) {
            System.out.println("Class:stateClass\n Method:allStates");
            System.out.println("Exception in stateClass " + ex.getMessage());
            ex.printStackTrace();
        }
        return "DepartmentAdmin/viewAlldetails";
    }

    //fetch All Cities
    /*
     *This Method is uses for fetch All Cities .
     */
    @RequestMapping("/AllCities")
    public String allCities(Model m, @ModelAttribute("cities") Cities cities) {
        System.out.println("----------------Method begin to call all cities in  country-state-city Controller----------------------");

        try {
            List<Cities> citiesList = citiesDaoImpl.fetchAll();
            m.addAttribute("citiesList", citiesList);
            m.addAttribute("msg3", "List of all Cities");
        } catch (Exception ex) {
            System.out.println("Class:cityClass\n Method:allCities");
            System.out.println("Exception in cityClass " + ex.getMessage());
            ex.printStackTrace();
        }
        return "DepartmentAdmin/viewAlldetails";
    }

    //Save Countrys
    /*
     *This Method is uses for Save Countrys .
     */
    @RequestMapping("/saveCountries")
    @ResponseBody
    public String saveCountries(@ModelAttribute("countries") Countries countries, @ModelAttribute("state") States state,
            @ModelAttribute("cities") Cities cities, Model m, RedirectAttributes ra,
            @RequestParam Integer countryp_id, HttpServletRequest request) {
        System.out.println("---------------------------Method called to save Countries-----------------------------------");
        String message = "";
        try {
            String result = countriesModel.validate(countries);
            System.out.println("~~ result ~~" + result);
            if (!result.equals("done")) {
                return result;
            }
            Logs logs = new Logs();
            Countries oldvalue = countriesDao.fetchData(countryp_id);

            if (countryp_id != null) {
                countries.setCountry_id(countryp_id);
                logs.setActivity("Country Update Activity");
                logs.setHeadingMsg("Country Master Log");
                logs.setLogMessage(oldvalue.getCountry_name() + " Country  is Replaced with " + countries.getCountry_name());

            } else {
                logs.setActivity("Country Save Activity");
                logs.setHeadingMsg("Country Master Log");
                logs.setLogMessage(countries.getCountry_name() + " Country Added Successfully");

            }

            Date date = new Date();
            countries.setCreated_date(date);

            String msg = "";
            Gson gson = new Gson();
            msg = countriesDao.checkDuplicateValue(countries);
            if (!"Duplicate Country Name".equalsIgnoreCase(msg) && !"Enter Country Name".equalsIgnoreCase(msg)) {
                countriesDao.insertData(countries);

                logs.setAuctionId(2);
                logs.setContractorId(3);
                logs.setDeptId(4);
                logs.setDeptUser("shashank shukla");
                logs.setDeptUserId(5);
                logs.setDscId("101");
                logs.setStatus("enable");
                logs.setLogId(6);
                logs.setRfqId(7);
                logs.setTenderId(8);
                logs.setIpAddress(logsAction.fetchIpAddress());
                logsAction.FetchOSName();
                logs.setOsName(logsAction.FetchOSName());
                logs.setMacAddress(logsAction.fetchMacAddress());
                logs.setBrowserName(logsAction.getClientBrowser(request));
                System.out.println("Date And Time:-" + logs.getDateTime());
                logsActionDao.save(logs);

                msg = "Country Added Successfully";
                return gson.toJson(msg);
            } else if (msg.equals("Duplicate Country Name")) {
                String msg2 = "Country Already Exist";
                return gson.toJson(msg2);
            } else if (msg.equals("Enter Country Name")) {
                String msg2 = "Please Enter Country name";
                return gson.toJson(msg2);
            }
            List<Countries> countryList = countriesDao.fetchAll();
            writeData(gson.toJson(countryList));
            System.out.println("---------------------------Method End to save Country-----------------------------------");
        } catch (Exception ex) {
            System.out.println("Class:CountriesClass\n Method:saveCountry");
            System.out.println("Exception in CountriesClass " + ex.getMessage());
            ex.printStackTrace();
        }
        return "redirect:/country_state_city";
    }

    //Save State
    /*
     *This Method is uses for Save States .
     */
    @RequestMapping("/saveState")
    @ResponseBody
    public String saveState(@ModelAttribute("state") States state, @ModelAttribute("countries") Countries countries,
            @ModelAttribute("cities") Cities cities, Model m, RedirectAttributes ra,
            @RequestParam Integer country_id, @RequestParam Integer state_idP, HttpServletRequest request) {
        System.out.println("---------------------------Method called to save State-----------------------------------" + state);
        Gson gson = new Gson();
        Logs logs = new Logs();
        String result = statesModel.validate(state);
        System.out.println("~~ result ~~" + result);
        if (!result.equals("done")) {
            return result;
        }

        States oldvalue = statesDaoImpl.fetchData(state_idP);

        if (state_idP != null) {
            state.setState_id(state_idP);
            logs.setActivity("State Update Activity");
            logs.setHeadingMsg("State Master Log");
            logs.setLogMessage(oldvalue.getState_name() + " State is Replaced with " + state.getState_name());

        } else {
            logs.setActivity("State Save Activity");
            logs.setHeadingMsg("State Master Log");
            logs.setLogMessage(state.getState_name() + " State Added Successfully ");
        }
        List<States> statesesList = null;
        try {

            Date date = new Date();
            state.setCreated_Date(date);

            String msg = statesDaoImpl.getDuplicateState(state);//calling getDuplicateCategory method
            if (msg.equalsIgnoreCase("State Already Exist")) {
                String msg2 = "State Already Exist";
                return gson.toJson(msg2);
            }
            if (!"State Already Exist".equalsIgnoreCase(msg)) {
                List<Countries> countryList = countriesDao.fetchAll();
                Iterator<Countries> iterator = countryList.iterator();
                while (iterator.hasNext()) {
                    Countries ctr = iterator.next();
                    if (country_id == ctr.getCountry_id()) {
                    }
                    System.out.println("Now we are save state data " + state.toString());
                    statesDaoImpl.insertData(state);
                    logs.setAuctionId(3);
                    logs.setContractorId(4);
                    logs.setDeptId(5);
                    logs.setDeptUser("shashank shukla");
                    logs.setDeptUserId(6);
                    logs.setDscId("DSC102");
                    logs.setStatus("enable");
                    logs.setLogId(7);
                    logs.setRfqId(8);
                    logs.setTenderId(9);
                    logs.setIpAddress(logsAction.fetchIpAddress());
                    logsAction.FetchOSName();
                    logs.setOsName(logsAction.FetchOSName());
                    logs.setMacAddress(logsAction.fetchMacAddress());
                    logs.setBrowserName(logsAction.getClientBrowser(request));
                    System.out.println("Date And Time:-" + logs.getDateTime());
                    logsActionDao.save(logs);

//                    statesesList = statesDaoImpl.fetchStates(country_id);
                    countryList = countriesDao.fetchAll();
                    m.addAttribute("countryList", countryList);
                    msg = "State Added Successfully";
                    return gson.toJson(msg);
                }
            }
        } catch (Exception ex) {
            System.out.println("Class:StateClass\n Method:saveState");
            System.out.println("Exception in StateClass " + ex.getMessage());
            ex.printStackTrace();
        }
        System.out.println("---------------------------Method End to save State-----------------------------------");

        return gson.toJson(statesesList);
    }

    //Save Citys 
    /*
     *This Method is uses for Save Citys .
     */
    @RequestMapping("/saveCity")
    @ResponseBody
    public String saveCity(@ModelAttribute("cities") Cities cities, @ModelAttribute("countries") Countries countries,
            @ModelAttribute("state") States state, Model m, RedirectAttributes ra,
            @RequestParam Integer state_id, @RequestParam Integer city_idP, HttpServletRequest request) {
        Gson gson = new Gson();
        Logs logs = new Logs();
        String result = citiesModel.validate(cities);
        System.out.println("~~ result ~~ " + result);
        if (!result.equals("done")) {
            return result;
        }
        List<Cities> citieseList = null;
        try {

            if (city_idP != null) {
                cities.setCity_id(city_idP);
                Cities oldValue = citiesDaoImpl.fetchByIdEdit(city_idP);
                logs.setActivity("City Update Activity");
                logs.setHeadingMsg("City Master Log");
                logs.setLogMessage(oldValue.getCity_name() + " City is Replaced with " + cities.getCity_name());

            } else {
                logs.setActivity("City Save Activity");
                logs.setHeadingMsg("City Master Log");
                logs.setLogMessage(cities.getCity_name() + " City Added successfully");
            }

            Date date = new Date();
            cities.setCreated_Date(date);

            String msg = citiesDaoImpl.getDuplicateCities(cities);//calling getDuplicateCategory method
            if (msg.equalsIgnoreCase("City Already Exist")) {
                String msg2 = "City Already Exist";
                return gson.toJson(msg2);
            }
            List<States> stateList = statesDaoImpl.fetchAll();
            Iterator<States> iterator1 = stateList.iterator();
            while (iterator1.hasNext()) {
                States states = iterator1.next();
                if (state_id == states.getState_id()) {

                }
            }
            System.out.println("We are finding error" + toString());

            citiesDaoImpl.insertData(cities);
            logs.setAuctionId(4);
            logs.setContractorId(5);
            logs.setDeptId(5);
            logs.setDeptUser("shashank shukla");
            logs.setDeptUserId(7);
            logs.setDscId("DSC103");
            logs.setStatus("enable");
            logs.setLogId(8);
            logs.setRfqId(9);
            logs.setTenderId(10);
            logs.setIpAddress(logsAction.fetchIpAddress());
            logsAction.FetchOSName();
            logs.setOsName(logsAction.FetchOSName());
            logs.setMacAddress(logsAction.fetchMacAddress());
            logs.setBrowserName(logsAction.getClientBrowser(request));
            System.out.println("Date And Time:-" + logs.getDateTime());
            logsActionDao.save(logs);

            citieseList = citiesDaoImpl.fetchCitiesByState(state_id);
            msg = "City Added Successfully";
            return gson.toJson(msg);

        } catch (Exception ex) {
            System.out.println("Class:CityClass\n Method:saveCity");
            System.out.println("Exception in CityClass " + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }

    // Show All Country 
    /*
     *This Method is uses to get all the countrys list .
     */
    @RequestMapping("/getCountryByAjax")
    @ResponseBody
    public String getCountryByAjax() {
        List<Countries> countryList = countriesDao.fetchAll();
        try {
            Gson gson = new Gson();
            writeData(gson.toJson(countryList));
        } catch (Exception ex) {
            System.out.println("Class:CountryClass\n Method:getCountryByAjax");
            System.out.println("Exception in CountryClass " + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }

    // Show AllStates 
    /*
     *This Method is uses to get all the state list .
     */
    @RequestMapping("/getAllStates")
    @ResponseBody
    public List<States> getAllStates() {
        try {
            List<States> stateList = statesDaoImpl.fetchAll();
            System.out.println("-------------statesList--------------");
            return stateList;
        } catch (Exception ex) {
            System.out.println("Class:StateClass\n Method:getAllStates");
            System.out.println("Exception in StateClass " + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }

    // Show AllCities 
    /*
     *This Method is uses to get all the Cities list .
     */
    @RequestMapping("/getAllCities")
    @ResponseBody
    public List<Cities> getAllCities() {
        List<Cities> citiesList = null;
        try {
            citiesList = citiesDaoImpl.fetchAll();
            System.out.println("-------------Cities List--------------");
            return citiesList;
        } catch (Exception ex) {
            System.out.println("Class:CityClass\n Method:getAllCities");
            System.out.println("Exception in CityClass " + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }

    private void writeData(String data) {
        try {
            RequestAttributes requestAttributes = RequestContextHolder.getRequestAttributes();
            HttpServletResponse httpServletResponse = ((ServletRequestAttributes) requestAttributes).getResponse();
            httpServletResponse.setContentType("text/plain");
            httpServletResponse.setCharacterEncoding("UTF-8");
            ServletOutputStream out = httpServletResponse.getOutputStream();
            out.print(data);
            out.flush();
            out.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    //Show All States 
/*
     *This Method is uses to get all the State list .
     */
    @RequestMapping("/Showstate")
    @ResponseBody
    public List<States> getStateByAjax(@RequestParam Integer country_id, Model m) {
        try {
            List<States> stateList = statesDaoImpl.fetchStates(country_id);
            return stateList;
        } catch (Exception ex) {
            System.out.println("Class:StateClass\n Method:getStateByAjax");
            System.out.println("Exception in StateClass " + ex.getMessage());
            ex.printStackTrace();
        }
        return null;

    }

    // Show All Citys 
    /*
     *This Method is uses to Show all the citys list .
     */
    @RequestMapping(value = "/getCitiesByAjax")
    @ResponseBody
    public String getCitiesByAjax(@RequestParam int state_id) {
        List<Cities> citiesList = null;
        try {
            citiesList = new ArrayList<>();
            citiesList = citiesDaoImpl.fetchCitiesByState(state_id);
            Gson gson = new Gson();
            writeData(gson.toJson(citiesList));
            return (gson.toJson(citiesList));
        } catch (Exception ex) {
            System.out.println("Class:CityClass\n Method:getCitiesByAjax");
            System.out.println("Exception in CityClass " + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }

    // Update Country 
    /*
     *This Method is uses to Update Country.
     */
    @RequestMapping("/countryEdit")
    @ResponseBody
    public String fetchCountry(@RequestParam Integer country_id, Model m) {
        try {
            Countries countries = countriesDao.fetchData(country_id);
            Gson gson = new Gson();
            return gson.toJson(countries);
        } catch (Exception ex) {
            System.out.println("Class:country\n Method:fetchCountry");
            System.out.println("Exception in country " + ex.getMessage());
        }
        return null;
    }

    // Update State
    /*
     *This Method is uses to Update State.
     */
    @RequestMapping("/editState")
    @ResponseBody
    public String fetchById(@RequestParam int state_id, Model m) {
        try {
            States states = statesDaoImpl.fetchData(state_id);

            Integer ID = states.getCountry_id();
            Countries countries = countriesDao.fetchData(ID);
            states.setCountry_name(countries.getCountry_name());

            System.out.println("Updated Countries Name:-" + countries.getCountry_name());
            Gson gson = new Gson();
            return gson.toJson(states);
        } catch (Exception ex) {
            System.out.println("Class:State\n Method:fetchById");
            System.out.println("Exception in StateClass " + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }

    //Update Citys 
    /*
     *This Method is uses to Update Citys.
     */
    @RequestMapping("/editcity")
    @ResponseBody
    public String fetchByIdcity(@RequestParam int city_id, Model m) {
        try {
            Cities cities = citiesDaoImpl.fetchByIdEdit(city_id);
            States states = statesDaoImpl.fetchData(cities.getState_id());

            Countries countries = countriesDao.fetchData(states.getCountry_id());
            cities.setCountry_id(countries.getCountry_id());
            cities.setCountry_name(countries.getCountry_name());
            cities.setState_name(states.getState_name());
            Gson gson = new Gson();
            return gson.toJson(cities);
        } catch (Exception ex) {
            System.out.println("Class:City\n Method:fetchByIdcity");
            System.out.println("Exception in CityClass " + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }

    //Delete City
    @RequestMapping("/delete_City")
    @ResponseBody
    public String delete_City(@RequestParam Integer id, Model m) {
        System.out.println("editKeyword method run" + id);
        try {
            String response = "";

            System.out.println("hhhhhhhhhhhhhhhhhhhhhhhh" + id);
            boolean deleteWord = citiesDaoImpl.removeData(id);
            System.out.println("DELETED ");
            if (deleteWord) {
                System.out.println("Tender City Key Word Deleted Successfully");
                response = "Tender City Key Word Deleted Successfully";
            } else {

                response = "FALSE";
            }

            return gson.toJson(response);

        } catch (Exception ex) {
            System.out.println("Exception::" + ex.getMessage());
            System.out.println("Class:KeywordController \n Method:editKeyword");
            ex.printStackTrace();
        }
        System.out.println("END*");
        return null;
    }

//Delete State
    @RequestMapping("/delete_State")
    @ResponseBody
    public String delete_State(@RequestParam Integer id, Model m) {
        System.out.println("editKeyword method run" + id);
        try {
            String response = "";
            List<Cities> c = new ArrayList<Cities>();
            c = citiesDaoImpl.fetchCitiesByState(id);
            System.out.println("Cities" + c);
            for (Cities city : c) {
                boolean result = citiesDaoImpl.removeDataList(city);

                if (result) {
                    System.out.println("DELETD");
                    boolean s = statesDaoImpl.removeData(id);
                    if (s) {
                        System.out.println("STATE DELETED");
                        response = "Tender State Key Word Deleted Successfully";
                    } else {
                        System.out.println("STATE NOT DELETED");
                        response = "FALSE";

                    }
                } else {
                    System.out.println("NOT");
                }
            }

            System.out.println("Tender City Key Word Deleted Successfully");
            response = "Tender City Key Word Deleted Successfully";
            return gson.toJson(response);

        } catch (Exception ex) {
            System.out.println("Exception::" + ex.getMessage());
            System.out.println("Class:KeywordController \n Method:editKeyword");
            ex.printStackTrace();
        }
        System.out.println("END*");
        return null;
    }

}
