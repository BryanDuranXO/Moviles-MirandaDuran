const admin = require('firebase-admin');



// Carga del archivo de credenciales del service account

const serviceAccount = require('./serviceAccountKey.json');



// Inicializar el SDK de Firebase Admin

admin.initializeApp({

  credential: admin.credential.cert(serviceAccount),

});



// TODO: pega aquí el token FCM que te dio la app Flutter

const deviceToken = 'fTmWZFgyQXiOve7pur8wSR:APA91bELAGj5zHfUNNItFzRhe5l7PWFJK3gOWn9qcL806iCuaMfRGmIp4qQAM9HMo0l2dfMoD-RenAXi95F9JJAvTGLraGdzfE9b_s3wsQxS9AFeEIs9vAs';



async function sendPush() {

  const message = {

    token: deviceToken,

    notification: {

      title: 'Hola desde Firebase Bryan',

      body: 'app cerrada',

    },

    data: {

      origen: 'node-demo',

      tipo: 'prueba',

    },

  };



  try {

    const response = await admin.messaging().send(message);

    console.log('✅ Mensaje enviado correctamente:', response);

  } catch (error) {

    console.error('❌ Error al enviar mensaje:', error);

  }

}



sendPush();