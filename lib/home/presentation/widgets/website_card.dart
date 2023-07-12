import 'package:auto_route/auto_route.dart';
import 'package:base_app/core/presentation/routes/app_router.dart';
import 'package:flutter/material.dart';

class WebsiteCard extends StatelessWidget {
  final String url;
  const WebsiteCard({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    var uri = Uri.parse(url);
    return GestureDetector(
      onTap: () {
        context.pushRoute(WebsiteRoute(url: url));
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                uri.host,
                style: textStyle.headlineSmall,
              ),
              IconButton(
                onPressed: () {
                  context.pushRoute(WebsiteRoute(url: url));
                },
                icon: const Icon(Icons.arrow_forward_ios_outlined),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
