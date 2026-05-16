# Checkout UX Reference

## Checkout Page Anatomy (Desktop)

```
+----------------------------------+---------------------------+
| Back to cart  [Logo]  [SSL]      |                           |
+----------------------------------+  ORDER SUMMARY            |
| STEP 1 of 3: CONTACT INFO        |  ----------------------   |
|                                  |  Product A    $29.00      |
| [Email address          ]        |  Product B    $15.00      |
| [Phone number           ]        |  ----------------------   |
|                                  |  Subtotal     $44.00      |
| SHIPPING ADDRESS                 |  Delivery      $5.00      |
| [First name] [Last name ]        |  ----------------------   |
| [Street address         ]        |  TOTAL        $49.00      |
| [City      ] [Postcode  ]        |                           |
| [Country dropdown       ]        |  SSL Secured              |
|                                  |  30-day returns           |
| [Continue to payment ->  ]       |  Free exchange            |
+----------------------------------+---------------------------+
```

## Checkout Page Anatomy (Mobile)

```
+-------------------------+
| <- [Logo]         [SSL] |
| ----------------------- |
| Order Summary (tap)     |
|   TOTAL: $49.00         |
| ----------------------- |
| Step 1 of 3: filled/empty/empty |
|                         |
| CONTACT INFO            |
| [Email               ]  |
| [Phone               ]  |
|                         |
| SHIPPING                |
| [First name          ]  |
| [Last name           ]  |
| [Street address      ]  |
| [City      ][Post    ]  |
| [Country dropdown    ]  |
|                         |
| [Continue to Payment -> ]|
| (Full-width, 48px tall) |
+-------------------------+
```

## Field Autocomplete Attributes

```html
<input type="text"    autocomplete="given-name"     name="first_name">
<input type="text"    autocomplete="family-name"    name="last_name">
<input type="email"   autocomplete="email"          name="email">
<input type="tel"     autocomplete="tel"            name="phone">
<input type="text"    autocomplete="street-address" name="address">
<input type="text"    autocomplete="address-level2" name="city">
<input type="text"    autocomplete="postal-code"    name="postcode">
<select               autocomplete="country"        name="country">
<input type="text"    autocomplete="cc-name"        name="card_name">
<input type="text"    autocomplete="cc-number"      name="card_number">
<input type="text"    autocomplete="cc-exp"         name="card_expiry">
<input type="text"    autocomplete="cc-csc"         name="card_cvv">
```

## Order Bump Component (Checkout)

```html
<!-- Place inside checkout form, above payment section -->
<div class="order-bump">
  <label>
    <input type="checkbox" name="order_bump" value="1">
    <div class="bump-content">
      <img src="bump-product.jpg" alt="Bump Product">
      <div>
        <strong>Add [Product Name] to your order</strong>
        <p>[One sentence: what it does + key benefit]</p>
        <span class="bump-price">Just $[price] — normally $[full price]</span>
      </div>
    </div>
  </label>
</div>
```

## Trust Badge Placement Rules

| Location | Badges to Show |
|----------|---------------|
| Below payment form headline | SSL padlock + "256-bit encryption" |
| Below payment method icons | Visa, Mastercard, M-Pesa, PayPal logos |
| Below CTA button | Money-back guarantee + returns policy snippet |
| Footer of checkout | Physical address + customer service contact |

## Error State Patterns

Inline validation (real-time):
- Field turns red border + shows message below on invalid input
- Field turns green border when valid

Submission error (if payment fails):
- Show error at TOP of form (scroll to it)
- Keep all fields filled — never clear the form on error
- Specific message: "Your card was declined. Please check the card number and try again."
- Offer alternative payment method if card fails twice

## Payment Step (Step 3)

```
PAYMENT METHOD
( ) M-Pesa          [Logo]
( ) Card            [Visa/MC logos]
( ) PayPal          [Logo]
( ) Bank Transfer

--- If M-Pesa selected: ---
[Phone number for M-Pesa push]
You will receive an M-Pesa prompt on your phone.
Enter your PIN to complete payment.

--- If Card selected: ---
[Card number          ] [MM/YY] [CVV]
[Name on card         ]
[ ] Save card for future purchases

[Lock icon: Pay $49.00 securely ->]

By completing your purchase you agree to our
Terms of Service and Privacy Policy
```
