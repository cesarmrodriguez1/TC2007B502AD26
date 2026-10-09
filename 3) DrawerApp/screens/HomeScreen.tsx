import React from 'react';
import {
  View,
  Text,
  StyleSheet,
  TouchableOpacity,
} from 'react-native';
import { Ionicons } from '@expo/vector-icons';
import { DrawerScreenProps } from '@react-navigation/drawer';

type DrawerParamList = {
  Inicio: undefined;
  Productos: undefined;
  Perfil: undefined;
};

type Props = DrawerScreenProps<DrawerParamList, 'Inicio'>;

export default function HomeScreen({ navigation }: Props) {
  return (
    <View style={styles.container}>

      <Ionicons
        name="home"
        size={80}
        color="#FFFFFF"
        style={styles.icon}
      />

      <Text style={styles.title}>
        ¡Bienvenido!
      </Text>

      <Text style={styles.description}>
        Esta es la pantalla de inicio de la aplicación.
      </Text>

      <Text style={styles.instruction}>
        Utiliza el menú lateral para navegar entre las
        diferentes pantallas.
      </Text>

      <TouchableOpacity
        style={styles.button}
        onPress={() => navigation.navigate('Productos')}
      >
        <Ionicons
          name="cart-outline"
          size={22}
          color="#FFFFFF"
        />

        <Text style={styles.buttonText}>
          Ver productos
        </Text>
      </TouchableOpacity>

      <TouchableOpacity
        style={styles.menuButton}
        onPress={() => navigation.openDrawer()}
      >
        <Ionicons
          name="menu"
          size={22}
          color="#FFFFFF"
        />

        <Text style={styles.buttonText}>
          Abrir menú
        </Text>
      </TouchableOpacity>

    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#3498DB',
    alignItems: 'center',
    justifyContent: 'center',
    padding: 25,
  },

  icon: {
    marginBottom: 20,
  },

  title: {
    fontSize: 32,
    fontWeight: 'bold',
    color: '#FFFFFF',
    marginBottom: 15,
  },

  description: {
    fontSize: 19,
    color: '#FFFFFF',
    textAlign: 'center',
    marginBottom: 15,
  },

  instruction: {
    fontSize: 16,
    color: '#EAF4FB',
    textAlign: 'center',
    marginBottom: 30,
    lineHeight: 24,
  },

  button: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'center',
    backgroundColor: '#217DBB',
    paddingVertical: 14,
    paddingHorizontal: 30,
    borderRadius: 30,
    marginBottom: 15,
    width: 220,
  },

  menuButton: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'center',
    backgroundColor: '#1B4F72',
    paddingVertical: 14,
    paddingHorizontal: 30,
    borderRadius: 30,
    width: 220,
  },

  buttonText: {
    color: '#FFFFFF',
    fontSize: 16,
    fontWeight: 'bold',
    marginLeft: 10,
  },
});

