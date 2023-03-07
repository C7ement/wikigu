// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/material.dart';

class NotFountPage extends StatelessWidget {
  const NotFountPage({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error: Not Found'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('The Page you are looking for was not found.'),
            SizedBox(height: 20),
            Text('Your application might not be up tu date. Try updating '
                'it throught the store.'),
            SizedBox(height: 20),
            Text('There might be a delay between android and ios updates.'
                ' Meaning you might not be able to access new items type right '
                'away and have to wait a few hours. '
                '\nI apologize for it.'),
          ],
        ),
      ),
    );
  }

  static Route<NotFountPage> route() {
    return MaterialPageRoute<NotFountPage>(
      builder: (_) => const NotFountPage(),
    );
  }
}
