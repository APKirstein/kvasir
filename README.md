![Build Status](https://codeship.com/projects/fe957b10-0b90-0133-be70-66578df262d2/status?branch=master)
![Code Climate](https://codeclimate.com/github/APKirstein/kvasir.png)
[![Coverage Status](https://coveralls.io/repos/APKirstein/kvasir/badge.svg)](https://coveralls.io/r/APKirstein/kvasir)

Kvasir Markets is an analyzer for the Eve Online market place. It was created
for use by anyone trading on this market to get info on the current Amarr market.
The data provided is from the Eve-marketdata API and currently does not include
volume. The Kvasir number calculated for users is a margin estimate of the
current prices for the Amarr market.

![Main page image](/app/assets/images/pic_1.png "Front Page")

From here I hope to integrate another API (once I find a stable one that provides
volume) for more information. This would allow me to make further more complex
calculations for my Kvasir number. In the future a new page will be integrated
into the My Items category for this that will include a detailed list of
items to buy in order to maximize profits.

![My items page](/app/assets/images/pic_2.png "My items page")

This app was created in Rails 2.2.0 and uses a rake task and module to import
data from the API. Future builds will focus on adding a delete task and
second migrate to move data daily into a JSON historical table to save space.
This will also allow for historical lookup of items. Markets will also be updated
adding data from all markets and marking each one searchable.

Admins are chosen by me and have the function of adding and deleting users.

![Admin page](/app/assets/images/pic_3.png "Admin page")

Developed at Launch Academy by Drew Kirstein
