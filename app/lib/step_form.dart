import 'package:app/page_body.dart';
import 'package:app/page_indicator.dart';
import 'package:flutter/material.dart';

const String url_1 =
    "https://img.freepik.com/vetores-gratis/logotipo-da-banana-legal-usando-oculos-escuros_23-2148742786.jpg?w=740&t=st=1708016775~exp=1708017375~hmac=6ab2a3f8bc701eebd885fb77b7395309eca1785b993679bac537d307c03860aa";

const String text_1 =
    'Este é o aplicativo para o seu controle financeiro!\n Não tome decisões tirando do cool';

class StepForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StepFormState();
  }
}

class _StepFormState extends State<StepForm> {
  final _stepFormControler = PageController();
  int _page = 0;
  final List _pageList = [
    pageBody(url_1, 'Cool Finance', text_1),
    Text('Page 2'),
    Text('Page 3'),
  ];

  void _changeStep(bool nextPage) {
    const duration = Duration(milliseconds: 300);
    const curve = Curves.easeIn;
    if (_page < _pageList.length - 1 && nextPage) {
      setState(() {
        _page++;
      });
      _stepFormControler.nextPage(duration: duration, curve: curve);
    } else if (_page >= 0 && !nextPage) {
      setState(() {
        _page--;
      });
      _stepFormControler.previousPage(duration: duration, curve: curve);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Step Form Page')),
        body: PageView.builder(
            controller: _stepFormControler,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return _pageList[index];
            }),
        bottomNavigationBar:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          TextButton(
              onPressed: () => _changeStep(false),
              child: const Text('Anterior')),
          pageIndicator(_page == 0),
          pageIndicator(_page == 1),
          pageIndicator(_page == 2),
          TextButton(
              onPressed: () => _changeStep(true), child: const Text('Próximo'))
        ]));
  }
}
