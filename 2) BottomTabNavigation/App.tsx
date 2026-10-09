import React from 'react';

import { NavigationContainer } from '@react-navigation/native';

import {
  createBottomTabNavigator,
} from '@react-navigation/bottom-tabs';

import HomeScreen from './screens/HomeScreen';
import ProductsScreen from './screens/ProductsScreen';
import ProfileScreen from './screens/ProfileScreen';

type RootTabParamList = {
	Inicio: undefined,
	Productos: undefined,
	Perfil: undefined
};

const Tab = createBottomTabNavigator<RootTabParamList>();

const App = () => {
  return (
  <NavigationContainer>
  <Tab.Navigator
      initialRouteName = "Inicio",
	  screenOptions:{({route}) => ({
		  headerShown: false,
		  tabBarActiveTintColor: '#1565C0',
		  tabBarInactiveTintColor: '#9E9E9E',
		  tabBarStyle:{
			  height: 70,
			  paddingBottom: 8,
			  paddingTop: 8
		  },
		  tabBarLabelStyle:{
			  fontSize: 13,
			  fontWeight: '600'
		  },
		  tabBarIcon: {{color, size}} =>{
			  let iconName:
			  | keyof typeof ionicons.glyphMap
			  | undefined
			  
			  if(route.name == 'Inicio'){
				  iconName = 'home';
			  }
			  else if (route.name === 'Productos'){
				  iconName = 'cart';
			  }
			  else if (route.name === 'Perfil'){
				  iconName = 'person';
			  }
			  
			  return = {
				  <Ionicons
				  name={iconName}
				  size={size}
				  color={color}
				  />
			  };
		  },
  })}
  >  
  
  <Tab.Screen
   name = "Inicio"
   component = {HomeScreen}
   options:{{
	   title:'Inicio',
   }}
   />
   
   <Tab.Screen
   name = "Productos"
   component = {ProductsScreen}
   options:{{
	   title:'Productos',
   }}
   />
   <Tab.Screen
   name = "Perfil"
   component = {ProfileScreen}
   options:{{
	   title:'Perfil',
   }}
   />
     </Tab.Navigator>
  </NavigatorContainer>
    );
};

export default App;