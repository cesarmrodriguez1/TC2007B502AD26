import React from 'react';

import {
  View,
  Text,
  StyleSheet,
  TouchableOpacity,
} from 'react-native';

const ProfileScreen = () => {
  return (

    <View style={styles.container}>

      <View style={styles.profileImage}>
        <Text style={styles.profileIcon}>
          👤
        </Text>
      </View>

      <Text style={styles.title}>
        Mi Perfil
      </Text>

      <Text style={styles.name}>
        Juan Pérez
      </Text>

      <Text style={styles.email}>
        juan.perez@example.com
      </Text>

      <View style={styles.infoCard}>

        <View style={styles.infoRow}>

          <Text style={styles.label}>
            Usuario
          </Text>

          <Text style={styles.value}>
            juanperez
          </Text>

        </View>

        <View style={styles.separator} />

        <View style={styles.infoRow}>

          <Text style={styles.label}>
            Tipo de cuenta
          </Text>

          <Text style={styles.value}>
            Premium
          </Text>

        </View>

        <View style={styles.separator} />

        <View style={styles.infoRow}>

          <Text style={styles.label}>
            Estado
          </Text>

          <Text style={styles.active}>
            Activo
          </Text>

        </View>

      </View>

      <TouchableOpacity
        style={styles.button}
        onPress={() => {
          console.log('Editar perfil');
        }}
      >
        <Text style={styles.buttonText}>
          Editar perfil
        </Text>
      </TouchableOpacity>

    </View>

  );
};

const styles = StyleSheet.create({

  container: {
    flex: 1,
    backgroundColor: '#FFF3E0',
    alignItems: 'center',
    padding: 25,
    paddingTop: 70,
  },

  profileImage: {
    width: 120,
    height: 120,
    borderRadius: 60,
    backgroundColor: '#FFFFFF',
    alignItems: 'center',
    justifyContent: 'center',
    elevation: 6,
    marginBottom: 20,
  },

  profileIcon: {
    fontSize: 60,
  },

  title: {
    fontSize: 28,
    fontWeight: 'bold',
    color: '#E65100',
    marginBottom: 10,
  },

  name: {
    fontSize: 21,
    fontWeight: 'bold',
    color: '#333333',
  },

  email: {
    fontSize: 15,
    color: '#777777',
    marginTop: 5,
    marginBottom: 25,
  },

  infoCard: {
    width: '100%',
    backgroundColor: '#FFFFFF',
    borderRadius: 20,
    padding: 20,
    elevation: 5,
  },

  infoRow: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    paddingVertical: 12,
  },

  label: {
    fontSize: 15,
    color: '#777777',
  },

  value: {
    fontSize: 15,
    fontWeight: 'bold',
    color: '#333333',
  },

  active: {
    fontSize: 15,
    fontWeight: 'bold',
    color: '#2E7D32',
  },

  separator: {
    height: 1,
    backgroundColor: '#EEEEEE',
  },

  button: {
    marginTop: 25,
    backgroundColor: '#E65100',
    paddingVertical: 15,
    paddingHorizontal: 40,
    borderRadius: 30,
    elevation: 4,
  },

  buttonText: {
    color: '#FFFFFF',
    fontSize: 16,
    fontWeight: 'bold',
  },

});

export default ProfileScreen;