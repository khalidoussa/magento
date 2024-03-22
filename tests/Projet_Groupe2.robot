*** Settings ***
Library     SeleniumLibrary
*** Variables ***
${url}=     https://magento.softwaretestingboard.com/
${browser}=     chrome

*** Keywords ***
navigate
    open browser    ${url}  ${browser}
    sleep   2
create an account

    click element   //html/body/div[2]/header/div[1]/div/ul/li[3]/a
    sleep   1
    input text      id:firstname       michelle2
    sleep   1
    input text      //*[@id="lastname"]    lefevre2
    sleep   1
    input text      //*[@id="email_address"]    michelle10.lef@gmail.com
    sleep   1
    input text      //*[@id="password"]     Michelle7892
    sleep   1
    input text      //*[@id="password-confirmation"]    Michelle7892
    sleep   1
    click button        //*[@id="form-validate"]/div/div[1]/button
    sleep   1
    element text should be      //*[@id="maincontent"]/div[1]/div[2]/div/div/div   Thank you for registering with Main Website Store.
    sleep   3
    Location Should Contain     /customer/account/
    element should be visible   //*[@id="maincontent"]/div[2]/div[1]/div[1]/h1/span
    ${nomprenom}=  get text    //*[@id="maincontent"]/div[2]/div[1]/div[4]/div[2]/div/div[1]/p
     should be equal    ${nomprenom}    michelle2 lefevre2\nmichelle10.lef@gmail.com

signin

    click element   //html/body/div[2]/header/div[1]/div/ul/li[2]/a
    input text  //*[@id="email"]    michelle6.lef@gmail.com
    input text  //*[@id="pass"]     Michelle7892
    click element   //*[@id="send2"]
    sleep   2
    click element   //*[@id="ui-id-8"]/span
    sleep   2
    click element   //*[@id="maincontent"]/div[4]/div[2]/div/div/ul[3]/li[1]/a
    sleep   2
    click element   //*[@id="maincontent"]/div[3]/div[1]/div[4]/ol/li[3]/div/a/span/span/img

    click button    //*[@id="product_addtocart_form"]/div/div/div[2]/button
    sleep   3
    #element text should be visible      You added Driven Backpack to your shopping cart.
    #sleep   4
    click element   //html/body/div[2]/header/div[2]/div[1]/a

    click button    //*[@id="top-cart-btn-checkout"]
    sleep   3
    input text      name:company     ata

    input text      css:[name="street[0]"]     14 rue de la paix
    input text       css:[name="city"]      Arizona
    select from list by label   css:[name="region_id"]           Arizona

    input text      css:[name="postcode"]      75000
    select from list by label    css:[name="country_id"]     United States
    input text      css:[name="telephone"]      0612345678
    select radio button    ko_unique_1     value=tablerate_bestway
    click button      //*[@id="shipping-method-buttons-container"]/div/button


    sleep   4
    click button    css:[title="Place Order"]
    sleep   6
    ${order}=  get text   css:[data-ui-id="page-title-wrapper"]

    should be equal     ${order}    Thank you for your purchase!
    sleep   4




*** Test Cases ***
create an account
    [Tags]      create
    navigate
    create an account
Sign In
    [Tags]      signin
    navigate
    signin
    close browser
