import numpy as np

#from flaskext.mysql import MySQL
from flask_mysqldb import MySQL
from flask import Flask, request, jsonify, render_template
import pickle


app = Flask(__name__)
app.config['MYSQL_HOST']= 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_SERVER'] = ''
app.config['MYSQL_DB'] = 'datarumahsakit'
mysql = MySQL(app)
model = pickle.load(open('model.pkl', 'rb'))

@app.route('/')
def home():
    return render_template('index.html')

@app.route('/hasil')
def hasil():
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM daftarruangan')
    barang = cur.fetchall()
    cur.close()
    return render_template('hasil.html', data = barang)

@app.route('/coba')
def coba():
    return render_template('coba.html')


@app.route('/predict',methods=['POST'])
def predict():
    '''
    For rendering results on HTML GUI
    '''
    int_features = [float(x) for x in request.form.values()]
    final_features = [np.array(int_features)]
    prediction = model.predict(final_features)

    # output = round(prediction[0], 2)
    if (prediction == 'Dibawah Empat Hari'):
        predictions = "1-3 Hari"
    else:
        predictions = "4-7 Hari"

    # if (prediction == 'Dibawah Empat Hari'):
    #     angka = int(3)
    # else:
    #     angka = int(4)

    if (prediction == 'Dibawah Empat Hari'):
        angkamin = int(1)
    else:
        angkamin = int(4)

    if (prediction == 'Dibawah Empat Hari'):
        angkamaks = int(3)
    else:
        angkamaks = int(7)

    
    curS = mysql.connection.cursor()
    curS.execute('SELECT * FROM hargaobat')
    obat = curS.fetchall()
    curS.close()


    curObat = mysql.connection.cursor()
    curObat.execute('SELECT diagnosis, SUM(harga_satuan) as jumlah_harga FROM hargaobat GROUP BY diagnosis')
    HargaObat = curObat.fetchall()
    curObat.close()

    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM ruanganrawatinap')
    barang = cur.fetchall()
    cur.close()
    # angka = prediction
    # return render_template('index.html', prediction_text='{}'.format(prediction))
    # return render_template('hasil.html', prediction_text='{}'.format(predictions), angkamin=angkamin, angkamaks=angkamaks, data = barang, obat=HargaObat, daftarobat = obat )
    return render_template('index.html', prediction_text='{}'.format(predictions), angkamin=angkamin, angkamaks=angkamaks, data = barang, obat=HargaObat, daftarobat = obat )


@app.route('/predict_api',methods=['POST'])
def predict_api():
    '''
    For direct API calls trought request
    '''
    data = request.get_json(force=True)
    prediction = model.predict([np.array(list(data.values()))])

    output = prediction[0]
    return jsonify(output)

if __name__ == "__main__":
    app.run(debug=True)