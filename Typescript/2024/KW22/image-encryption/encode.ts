import fs from 'fs';
import Jimp from "jimp";

interface RGBA {
    r: number;
    g: number;
    b: number;
    a: number;
}


let inputString = "Titel: 🍪Die HE🍪llloo🍪 fantastische Reise der Keks-Krieger- Im Bann der backenden Bäcker (Die erweiterte Saga)🍪📖Prologus📖In einem kleinen, idyllischen 🏡Dörfchen🏡 namens 🍪Crumbtown🍪, lebten die 👩🍳Konditoren👨🍳 in Harmonie mit den 🍪Keksen🍪, die sie erschufen. Doch eines Tages bedrohte eine 👹schreckliche Macht👺 die süße Welt von Crumbtown – der 🧪Böse Wissenschaftler🧪, 🔬Dr. Mixalot🔬!✊🍪Kapitel I - Die Entscheidung🍪✊Als 👩🍳Alice👩🍳, die beste Konditorin Crumbtowns, von Dr. Mixalots finsterem Plan erfuhr, beschloss sie, die Keks-Krieger zu versammeln, um ihre Welt zu retten. Zusammen mit dem 🥄Knusper-Kämpfer🥄, dem 🧁Zimt-Zerstörer🧁 und dem 🍪Karamell-Kämpfer🍪 brach Alice auf, um Dr. Mixalot zu stoppen. Auf ihrem Weg durch fantastische 🌄Landschaften🌄 und gefährliche 🏞️Gebirge🏞️ trafen die Keks-Krieger auf fabelhafte 🦄Wesen🦄 und kämpften gegen 👹böse Schergen👺. Ihre Bande wuchs, als sie die 🧁Spritzgebäck-Schützin🧁 und den 🍪Makronen-Mann🍪 rekrutierten.💥🍪Kapitel II - Die Reise beginnt🍪💥Als Alice und die Keks-Krieger das Dorf verließen, spürten sie eine unheimliche Anspannung in der Luft. Dr. Mixalot hatte ein 🔮mächtiges Artefakt🔮 gestohlen, das die Kräfte der Kekse verstärkte. Nun wollte er die Kekse unter seine Kontrolle bringen, um Crumbtown zu erobern.✏️🍪Kapitel III - Die Suche nach dem Artefakt🍪✏️Auf ihrer Suche nach dem 🔮Artefakt🔮 stießen Alice und die Keks-Krieger auf mysteriöse 🏚️Ruinen🏚️ und verborgene 🕰️Tempel🕰️. In diesen Orten lernten sie, ihre Kräfte durch 🍪Back-Rituale🍪 zu verstärken. So wurden sie zu einem unschlagbaren Team. Schließlich entdeckten sie, dass Dr. Mixalot das 🔮Artefakt🔮 in seinem geheimen 🏰Labor🏰 verborgen hatte.📚🍪Kapitel IV - Die Bibliothek der Backkunst🍪📚Auf ihrem Weg zum Labor stießen Alice und die Keks-Krieger auf eine geheimnisvolle 📚Bibliothek📚. Hier fanden sie alte 📜Schriften📜, die ihnen halfen, die 🍪Back-Kunst🍪 besser zu verstehen. In der Bibliothek lernten die Keks-Krieger, wie sie ihre Kräfte mit den 🍪Zutaten🍪 verbanden, die sie auf ihrer Reise gesammelt hatten.🎲🍪Kapitel V - Das Glück der Würfel🍪🎲In der Bibliothek entdeckten die Keks-Krieger auch 🎲Würfel🎲, die ihnen halfen, ihre Entscheidungen zu treffen. Diese Würfel waren mit den 🍪Back-Kräften🍪 verbunden und halfen den Kriegern, die richtigen Wege zu wählen. Dank der Würfel konnten Alice und die Keks-Krieger schließlich das geheime 🏰Labor🏰 von Dr. Mixalot 🔓entriegeln🔓.⚔️🍪Kapitel VI - Das große Finale🍪⚔️Die Keks-Krieger stellten sich dem 🧪Wissenschaftler🧪 und seinen Schergen in einem letzten, epischen Kampf. Mit vereinten Kräften gelang es ihnen, Dr. Mixalot zu besiegen und das 🔮Artefakt🔮 zurückzuerobern. Die 🍪Kekse🍪 wurden befreit und kehrten zu ihrem friedlichen Leben in Crumbtown zurück.🍪Epilogus🍪🌈Die Keks-Krieger wurden als Helden gefeiert und kehrten in ihr Dorf zurück. Doch obwohl der Frieden wiederhergestellt war, wussten sie, dass neue Abenteuer auf sie warteten. Denn die Welt der Kekse war voller Geheimnisse und Herausforderungen. Die Geschichte der Keks-Krieger sollte für immer in den Herzen der Crumbtown-Bewohner weiterleben. 💖 Die fantastische Reise der Keks-Krieger war nur der Anfang einer epischen Saga, die noch viele weitere Kapitel umfassen sollte. Denn die Welt von Crumbtown war größer, als sie alle jemals gedacht hätten. 🍪🌏🍪";

fs.readFile('input.html', 'utf8', (err, data) => {
    if (err) {
        console.error(err);
        return;
    }

    inputString = data
});

let imagePath = "input.jpg";

Jimp.read(imagePath)
    .then((image) => {
        let encodedString = encodeString(inputString);
        image.scan(0, 0, image.bitmap.width, image.bitmap.height, (x, y, idx) => {
            let index = x + y * image.bitmap.width;
            let hexPixel = image.getPixelColor(x, y);
            let RGBAPixel = Jimp.intToRGBA(hexPixel);
            let encodedPixel = getEncodedPixel(RGBAPixel, encodedString, index);
            let encodedHex = Jimp.rgbaToInt(encodedPixel.r, encodedPixel.g, encodedPixel.b, encodedPixel.a);
            image.setPixelColor(encodedHex, x, y);
        })
        image.write("output.png");
    });



function getEncodedPixel(RGBAPixel: RGBA, encodedString: Uint8Array, index: number): RGBA {
    if (index > encodedString.length + 4) return RGBAPixel;
    if (index < 4) {
        let currentByte = encodedString.length >> (8 * (3 - index))
        return encodeByteIntoPixel(RGBAPixel, currentByte);
    }
    let currentByte = encodedString[index - 4];
    return encodeByteIntoPixel(RGBAPixel, currentByte);
}

function encodeByteIntoPixel(RGBAPixel: RGBA, byteToEncode: number) {
    let pixel: RGBA = {
        r: (RGBAPixel.r & 0b1111_1100) | ((byteToEncode & 0b1100_0000) >> 6),
        g: (RGBAPixel.g & 0b1111_1100) | ((byteToEncode & 0b0011_0000) >> 4),
        b: (RGBAPixel.b & 0b1111_1100) | ((byteToEncode & 0b0000_1100) >> 2),
        a: (RGBAPixel.a & 0b1111_1100) | ((byteToEncode & 0b0000_0011)),
    }
    return pixel;
}

function encodeString(inputString: string) {
    let textEncoder = new TextEncoder;
    return textEncoder.encode(inputString);
}

