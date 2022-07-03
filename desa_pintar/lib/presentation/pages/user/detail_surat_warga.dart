import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'dart:typed_data';

class DetailSuratWarga extends StatefulWidget {
  DetailSuratWarga({Key? key, required this.no_surat}) : super(key: key);
  String no_surat;
  @override
  State<DetailSuratWarga> createState() => _DetailSuratWargaState();
}

class _DetailSuratWargaState extends State<DetailSuratWarga> {
  final _formKey = GlobalKey<FormState>();

  //inisialize field
  var no_surat = TextEditingController();
  var tanggal_surat = TextEditingController();
  var perihal = TextEditingController();
  var ttd = TextEditingController();

  @override
  void initState() {
    super.initState();
    //in first time, this method will be executed
    _getData();
  }

  Future _getData() async {
    try {
      final response = await http.get(Uri.parse(
          //you have to take the ip address of your computer.
          //because using localhost will cause an error
          "http://192.168.1.7/dpin_db/detail_surat.php?no_surat='${widget.no_surat}'"));

      // if response successful
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        // entry data to variabel list _get
        setState(() {
          no_surat = TextEditingController(text: data['no_surat']);
          tanggal_surat = TextEditingController(text: data['tanggal_surat']);
          perihal = TextEditingController(text: data['jenis_surat']);
          ttd = TextEditingController(text: data['level']);
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 61, 192, 150),
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_outlined,
                color: Colors.white,
                size: 25,
              ),
            ),
          ),
        ),
        title: const Text('Detail Surat'),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.all(10),
                  child: const Text(
                    'Info Surat',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Container(
                    margin: const EdgeInsets.only(
                      // left: 10,
                      right: 10,
                    ),
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                flex: 1,
                                child: const Text(
                                  'Nomor Surat',
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: const Text(
                                    'KeteranganDomisili  /',
                                    style: const TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: 40,
                                child: TextFormField(
                                  readOnly: true,
                                  controller: no_surat,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Note Title is Required!';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: const Text(
                                  '/ 06 / 2022',
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                flex: 1,
                                child: Text(
                                  'Tanggal Surat',
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 2,
                                child: TextFormField(
                                  readOnly: true,
                                  controller: tanggal_surat,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Note Title is Required!';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                flex: 1,
                                child: Text(
                                  'Perihal',
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 2,
                                child: TextFormField(
                                  readOnly: true,
                                  controller: perihal,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Note Title is Required!';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                flex: 1,
                                child: Text(
                                  'Penandatangan',
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 2,
                                child: TextFormField(
                                  readOnly: true,
                                  initialValue: 'Ketua RT, Ketua RW ',
                                  // controller: perihal,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Note Title is Required!';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                flex: 1,
                                child: Text(
                                  'Asal Surat',
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 2,
                                child: TextFormField(
                                  readOnly: true,
                                  initialValue: 'Baiq Tasya',
                                  // controller: perihal,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Note Title is Required!';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          const Divider(
            height: 10,
            color: Color.fromARGB(255, 207, 206, 206),
            thickness: 2,
          ),
          Container(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(
                      top: 10, left: 10, right: 10, bottom: 1),
                  child: const Text(
                    'Detail Surat',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                Container(
                  color: const Color.fromARGB(255, 226, 246, 239),
                  margin: EdgeInsets.all(10),
                  child: Ink(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(15),
                      onTap: _displayPdf,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: SizedBox(
                                  width: 70,
                                  height: 70,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      'assets/assets_dpin/pdf.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextFormField(
                                      readOnly: true,
                                      controller: perihal,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                      ),
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Note Title is Required!';
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(height: 5),
                                    Row(
                                      children: [
                                        Text(
                                          '1 page',
                                          style: TextStyle(
                                            color: Colors.grey.shade500,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 5),
                                    Row(
                                      children: [
                                        Text(
                                          '345 KB',
                                          style: TextStyle(
                                            color: Colors.grey.shade500,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _displayPdf() {
    final doc = pw.Document();
    doc.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Center(
                child: pw.Text(
                    'RUKUN TETANGGA 01/01 PERUMAHAN GRIYA ALAM SENTOSA\nDESA PASAR ANGIN, KECAMATAN CILEUNGSI\nKABUPATEN LOMBOK TIMUR',
                    textAlign: pw.TextAlign.center,
                    style: pw.TextStyle(fontSize: 15)),
              ),
              pw.Divider(height: 1),
              pw.SizedBox(height: 10),
              pw.Center(
                child: pw.Column(children: [
                  pw.Text(
                    'SURAT KETERANGAN DOMISILI',
                    style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold,
                      fontSize: 18,
                      decoration: pw.TextDecoration.underline,
                    ),
                  ),
                  pw.Text('No.      /INT/III/2022'),
                ]),
              ),
              pw.SizedBox(height: 20),
              pw.Text(
                'Yang bertanda tangan di bawah ini Ketua RT.01 RW.01 Desa Pasar Angin Kecamatan Cilengsi Kabupaten Lombok Timur, Menerangkan bahwa :',
                textAlign: pw.TextAlign.justify,
              ),
              pw.ListView(
                children: [
                  pw.Column(
                    children: [
                      pw.Container(
                        margin: pw.EdgeInsets.only(
                          left: 10,
                          right: 50,
                        ),
                        alignment: pw.Alignment.centerLeft,
                        child: pw.Row(
                          crossAxisAlignment: pw.CrossAxisAlignment.center,
                          children: [
                            pw.Expanded(
                              flex: 4,
                              child: pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.start,
                                children: [
                                  pw.Text(
                                    "1. Nama",
                                    style: pw.TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            pw.Expanded(
                              flex: 8,
                              child: pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.start,
                                children: [
                                  pw.Text(
                                    ": Udin Sedunia",
                                    style: pw.TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      pw.SizedBox(height: 5),
                      pw.Container(
                        margin: pw.EdgeInsets.only(
                          left: 10,
                          right: 50,
                        ),
                        alignment: pw.Alignment.centerLeft,
                        child: pw.Row(
                          crossAxisAlignment: pw.CrossAxisAlignment.center,
                          children: [
                            pw.Expanded(
                              flex: 4,
                              child: pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.start,
                                children: [
                                  pw.Text(
                                    "2. Jenis Kelamin",
                                    style: pw.TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            pw.Expanded(
                              flex: 8,
                              child: pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.start,
                                children: [
                                  pw.Text(
                                    ": Perempuan",
                                    style: pw.TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      pw.Container(
                        margin: pw.EdgeInsets.only(
                          left: 10,
                          right: 50,
                        ),
                        alignment: pw.Alignment.centerLeft,
                        child: pw.Row(
                          crossAxisAlignment: pw.CrossAxisAlignment.center,
                          children: [
                            pw.Expanded(
                              flex: 4,
                              child: pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.start,
                                children: [
                                  pw.Text(
                                    "3. Tempat/Tanggal Lahir",
                                    style: pw.TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            pw.Expanded(
                              flex: 8,
                              child: pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.start,
                                children: [
                                  pw.Text(
                                    ": Mars, 12 Desember 2022",
                                    style: pw.TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      pw.Container(
                        margin: pw.EdgeInsets.only(
                          left: 10,
                          right: 50,
                        ),
                        alignment: pw.Alignment.centerLeft,
                        child: pw.Row(
                          crossAxisAlignment: pw.CrossAxisAlignment.center,
                          children: [
                            pw.Expanded(
                              flex: 4,
                              child: pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.start,
                                children: [
                                  pw.Text(
                                    "4. NO. KK/KTP",
                                    style: pw.TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            pw.Expanded(
                              flex: 8,
                              child: pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.start,
                                children: [
                                  pw.Text(
                                    ": 1234567890123456",
                                    style: pw.TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      pw.Container(
                        margin: pw.EdgeInsets.only(
                          left: 10,
                          right: 50,
                        ),
                        alignment: pw.Alignment.centerLeft,
                        child: pw.Row(
                          crossAxisAlignment: pw.CrossAxisAlignment.center,
                          children: [
                            pw.Expanded(
                              flex: 4,
                              child: pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.start,
                                children: [
                                  pw.Text(
                                    "5. Pekerjaan",
                                    style: pw.TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            pw.Expanded(
                              flex: 8,
                              child: pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.start,
                                children: [
                                  pw.Text(
                                    ": Mahasiswa",
                                    style: pw.TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      pw.Container(
                        margin: pw.EdgeInsets.only(
                          left: 10,
                          right: 50,
                        ),
                        alignment: pw.Alignment.centerLeft,
                        child: pw.Row(
                          crossAxisAlignment: pw.CrossAxisAlignment.center,
                          children: [
                            pw.Expanded(
                              flex: 4,
                              child: pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.start,
                                children: [
                                  pw.Text(
                                    "6. Agama",
                                    style: pw.TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            pw.Expanded(
                              flex: 8,
                              child: pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.start,
                                children: [
                                  pw.Text(
                                    ": Islam",
                                    style: pw.TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      pw.Container(
                        margin: pw.EdgeInsets.only(
                          left: 10,
                          right: 50,
                        ),
                        alignment: pw.Alignment.centerLeft,
                        child: pw.Row(
                          crossAxisAlignment: pw.CrossAxisAlignment.center,
                          children: [
                            pw.Expanded(
                              flex: 4,
                              child: pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.start,
                                children: [
                                  pw.Text(
                                    "7. Kewarganegaraan",
                                    style: pw.TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            pw.Expanded(
                              flex: 8,
                              child: pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.start,
                                children: [
                                  pw.Text(
                                    ": Indonesia",
                                    style: pw.TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      pw.Container(
                        margin: pw.EdgeInsets.only(
                          left: 10,
                          right: 50,
                        ),
                        alignment: pw.Alignment.centerLeft,
                        child: pw.Row(
                          crossAxisAlignment: pw.CrossAxisAlignment.center,
                          children: [
                            pw.Expanded(
                              flex: 4,
                              child: pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.start,
                                children: [
                                  pw.Text(
                                    "8. Alamat",
                                    style: pw.TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            pw.Expanded(
                              flex: 8,
                              child: pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.start,
                                children: [
                                  pw.Text(
                                    ": Perum Griya Alam Sentosa Blok H, No 12, RT.01, RW.01, Perum Griya Alam Sentosa, Desa Pasar Angin, Kecamatan Cileungsi, Kabupaten Lombok Timur",
                                    style: pw.TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              pw.Text(
                'Adalah benar warga kami di lingkungan RT.01, RW 01, Perum Griya Alam Sentosa, Desa Pasir Angin, Kecamatan Cilengsi, Kabupaten Lombok Timur',
                textAlign: pw.TextAlign.justify,
              ),
              pw.SizedBox(height: 20),
              pw.Text(
                'Demikian Surat keterangan domisili ini dibuat untuk dipergunakan sebagaimana mestinya.',
                textAlign: pw.TextAlign.justify,
              ),
              pw.SizedBox(height: 30),
              pw.Container(
                child: pw.Row(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  mainAxisAlignment: pw.MainAxisAlignment.start,
                  children: [
                    pw.Expanded(
                      flex: 4,
                      child: pw.Column(
                        children: [],
                      ),
                    ),
                    pw.SizedBox(width: 10),
                    pw.Expanded(
                      flex: 4,
                      child: pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.end,
                        mainAxisAlignment: pw.MainAxisAlignment.end,
                        children: [
                          pw.Text('Pasar Angin, 12 Juni 2022'),
                          pw.Text(
                            "Ketua RT.01, RW.01",
                            style: pw.TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          pw.SizedBox(height: 50),
                          pw.Text(
                            "Supriadin",
                            style: pw.TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );

    /// open Preview Screen
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PreviewScreen(doc: doc),
      ),
    );
  }
}

Future<Uint8List> _generatePdf(PdfPageFormat format, String title) async {
  final pdf = pw.Document(version: PdfVersion.pdf_1_5, compress: true);
  final font = await PdfGoogleFonts.nunitoExtraLight();

  pdf.addPage(
    pw.Page(
      pageFormat: format,
      build: (context) {
        return pw.Column(
          children: [
            pw.SizedBox(
              width: double.infinity,
              child: pw.FittedBox(
                child: pw.Text(title, style: pw.TextStyle(font: font)),
              ),
            ),
            pw.SizedBox(height: 20),
            pw.Flexible(child: pw.FlutterLogo())
          ],
        );
      },
    ),
  );
  return pdf.save();
}

void generatePdf() async {
  const title = 'eclectify Demo';
  await Printing.layoutPdf(onLayout: (format) => _generatePdf(format, title));
}

class PreviewScreen extends StatelessWidget {
  final pw.Document doc;

  const PreviewScreen({
    Key? key,
    required this.doc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_outlined),
        ),
        centerTitle: true,
        title: Text("Preview"),
      ),
      body: PdfPreview(
        build: (format) => doc.save(),
        allowSharing: true,
        allowPrinting: true,
        initialPageFormat: PdfPageFormat.a4,
        pdfFileName: "mydoc.pdf",
      ),
    );
  }
}
