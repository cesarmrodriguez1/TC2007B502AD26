import React from 'react';

import {
  View,
  Text,
  StyleSheet,
  TouchableOpacity,
} from 'react-native';

const HomeScreen = () => {
  return (
    <View style={styles.container}>

      <View style={styles.iconContainer}>
        <Text style={styles.icon}>
          🏠
        </Text>
      </View>

      <Text style={styles.title}>
        Pantalla de Inicio
      </Text>

      <Text style={styles.description}>
        Bienvenido a nuestra aplicación móvil.
      </Text>

      <Text style={styles.info}>
        Utiliza las pestañas inferiores para navegar
        entre las diferentes secciones.
      </Text>

      <TouchableOpacity
        style={styles.button}
        onPress={() => {
          console.log('Botón presionado');
        }}
      >
        <Text style={styles.buttonText}>
          Explorar aplicación
        </Text>
      </TouchableOpacity>

    </View>
  );
};

const styles = StyleSheet.create({

  container: {
    flex: 1,
    backgroundColor: '#E8F5E9',
    alignItems: 'center',
    justifyContent: 'center',
    padding: 25,
  },

  iconContainer: {
    width: 100,
    height: 100,
    borderRadius: 50,
    backgroundColor: '#FFFFFF',
    alignItems: 'center',
    justifyContent: 'center',
    marginBottom: 25,
    elevation: 5,
  },

  icon: {
    fontSize: 50,
  },

  title: {
    fontSize: 28,
    fontWeight: 'bold',
    color: '#1B5E20',
    marginBottom: 15,
  },

  description: {
    fontSize: 19,
    color: '#2E7D32',
    textAlign: 'center',
    marginBottom: 15,
  },

  info: {
    fontSize: 15,
    color: '#555555',
    textAlign: 'center',
    lineHeight: 23,
    marginBottom: 30,
  },

  button: {
    backgroundColor: '#2E7D32',
    paddingVertical: 15,
    paddingHorizontal: 35,
    borderRadius: 30,
    elevation: 4,
  },

  buttonText: {
    color: '#FFFFFF',
    fontSize: 16,
    fontWeight: 'bold',
  },

});

export default HomeScreen;