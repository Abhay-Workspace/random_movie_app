import 'package:flutter/material.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie Dare'),
        backgroundColor: Color(0xFF1f2836),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            Text(
              'Movie Dare Terms of Service',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                '''1. Terms
By accessing our app, Movie Dare, you are agreeing to be bound by these terms of service, all applicable laws and regulations, and agree that you are responsible for compliance with any applicable local laws. If you do not agree with any of these terms, you are prohibited from using or accessing Movie Dare. The materials contained in Movie Dare are protected by applicable copyright and trademark law.

2. Use License
Permission is granted to temporarily download one copy of Movie Dare per device for personal, non-commercial transitory viewing only. This is the grant of a license, not a transfer of title, and under this license you may not:
modify or copy the materials;
use the materials for any commercial purpose, or for any public display (commercial or non-commercial);
attempt to decompile or reverse engineer any software contained in Movie Dare;
remove any copyright or other proprietary notations from the materials; or
transfer the materials to another person or "mirror" the materials on any other server.
This license shall automatically terminate if you violate any of these restrictions and may be terminated by Tackwit at any time. Upon terminating your viewing of these materials or upon the termination of this license, you must destroy any downloaded materials in your possession whether in electronic or printed format.
3. Disclaimer
The materials within Movie Dare are provided on an 'as is' basis. Tackwit makes no warranties, expressed or implied, and hereby disclaims and negates all other warranties including, without limitation, implied warranties or conditions of merchantability, fitness for a particular purpose, or non-infringement of intellectual property or other violation of rights.
Further, Tackwit does not warrant or make any representations concerning the accuracy, likely results, or reliability of the use of the materials on its website or otherwise relating to such materials or on any sites linked to Movie Dare.
4. Limitations
In no event shall Tackwit or its suppliers be liable for any damages (including, without limitation, damages for loss of data or profit, or due to business interruption) arising out of the use or inability to use Movie Dare, even if Tackwit or a Tackwit authorized representative has been notified orally or in writing of the possibility of such damage. Because some jurisdictions do not allow limitations on implied warranties, or limitations of liability for consequential or incidental damages, these limitations may not apply to you.

5. Accuracy of materials
The materials appearing in Movie Dare could include technical, typographical, or photographic errors. Tackwit does not warrant that any of the materials on Movie Dare are accurate, complete or current. Tackwit may make changes to the materials contained in Movie Dare at any time without notice. However Tackwit does not make any commitment to update the materials.

6. Links
Tackwit has not reviewed all of the sites linked to its app and is not responsible for the contents of any such linked site. The inclusion of any link does not imply endorsement by Tackwit of the site. Use of any such linked website is at the user's own risk.

7. Modifications
Tackwit may revise these terms of service for its app at any time without notice. By using Movie Dare you are agreeing to be bound by the then current version of these terms of service.

8. Governing Law
These terms and conditions are governed by and construed in accordance with the laws of India and you irrevocably submit to the exclusive jurisdiction of the courts in that State or location. ''',
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
