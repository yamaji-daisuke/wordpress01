wordpress01 Cookbook
====================
このクックブックを適用することで、以下の事が実現できます。

- リポジトリから最新状態に更新
- Nginx と php-fpm の導入と設定
- MySQL の導入と設定
- Wordpressの最新版の導入

実行後に以下のURLをアクセスして、Wordpressのインストールを完了します。

    http://IPアドレス/wordpress/


要件(Requirements)
------------

現在対応しているサーバーのOSは、Ubuntu 14.04 LTS 64bit です。



属性(Attributes)
----------
TODO: List your cookbook attributes here.

e.g.
#### wordpress01::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['wordpress01']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

Usage
-----
#### wordpress01::default
TODO: Write usage instructions for each cookbook.

e.g.
Just include `wordpress01` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[wordpress01]"
  ]
}
```

Contributing
------------
TODO: (optional) If this is a public cookbook, detail the process for contributing. If this is a private cookbook, remove this section.

e.g.
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: TODO: List authors
