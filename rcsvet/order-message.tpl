{**
* NOTICE OF LICENSE
*
* This source file is subject to the Software License Agreement
* that is bundled with this package in the file LICENSE.txt.
*
*  @author    Peter Sliacky (Zelarg)
*  @license   http://opensource.org/licenses/osl-3.0.php  Open Software License (OSL 3.0)
*}
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com?plugins=forms,typography"></script>
		<script src="https://unpkg.com/unlazy@0.11.3/dist/unlazy.with-hashing.iife.js" defer init></script>
		<script type="text/javascript">
			window.tailwind.config = {
				darkMode: ['class'],
				theme: {
					extend: {
						colors: {
							border: 'hsl(var(--border))',
							input: 'hsl(var(--input))',
							ring: 'hsl(var(--ring))',
							background: 'hsl(var(--background))',
							foreground: 'hsl(var(--foreground))',
							primary: {
								DEFAULT: 'hsl(var(--primary))',
								foreground: 'hsl(var(--primary-foreground))'
							},
							secondary: {
								DEFAULT: 'hsl(var(--secondary))',
								foreground: 'hsl(var(--secondary-foreground))'
							},
							destructive: {
								DEFAULT: 'hsl(var(--destructive))',
								foreground: 'hsl(var(--destructive-foreground))'
							},
							muted: {
								DEFAULT: 'hsl(var(--muted))',
								foreground: 'hsl(var(--muted-foreground))'
							},
							accent: {
								DEFAULT: 'hsl(var(--accent))',
								foreground: 'hsl(var(--accent-foreground))'
							},
							popover: {
								DEFAULT: 'hsl(var(--popover))',
								foreground: 'hsl(var(--popover-foreground))'
							},
							card: {
								DEFAULT: 'hsl(var(--card))',
								foreground: 'hsl(var(--card-foreground))'
							},
						},
					}
				}
			}
		</script>
		<style type="text/tailwindcss">
			@layer base {
				:root {
					--background: 0 0% 100%;
--foreground: 240 10% 3.9%;
--card: 0 0% 100%;
--card-foreground: 240 10% 3.9%;
--popover: 0 0% 100%;
--popover-foreground: 240 10% 3.9%;
--primary: 240 5.9% 10%;
--primary-foreground: 0 0% 98%;
--secondary: 240 4.8% 95.9%;
--secondary-foreground: 240 5.9% 10%;
--muted: 240 4.8% 95.9%;
--muted-foreground: 240 3.8% 46.1%;
--accent: 240 4.8% 95.9%;
--accent-foreground: 240 5.9% 10%;
--destructive: 0 84.2% 60.2%;
--destructive-foreground: 0 0% 98%;
--border: 240 5.9% 90%;
--input: 240 5.9% 90%;
--ring: 240 5.9% 10%;
--radius: 0.5rem;
				}
				.dark {
					--background: 240 10% 3.9%;
--foreground: 0 0% 98%;
--card: 240 10% 3.9%;
--card-foreground: 0 0% 98%;
--popover: 240 10% 3.9%;
--popover-foreground: 0 0% 98%;
--primary: 0 0% 98%;
--primary-foreground: 240 5.9% 10%;
--secondary: 240 3.7% 15.9%;
--secondary-foreground: 0 0% 98%;
--muted: 240 3.7% 15.9%;
--muted-foreground: 240 5% 64.9%;
--accent: 240 3.7% 15.9%;
--accent-foreground: 0 0% 98%;
--destructive: 0 62.8% 30.6%;
--destructive-foreground: 0 0% 98%;
--border: 240 3.7% 15.9%;
--input: 240 3.7% 15.9%;
--ring: 240 4.9% 83.9%;
				}
			}
		</style>
  </head>
  <body>
    <div class="max-w-sm mx-auto bg-card p-6 rounded-lg shadow-md">
 <h2 class="text-lg font-semibold text-foreground"><center>Podrobnosti karty</center></h2>
  <div class="flex items-center space-x-2 mt-2">
    <img src="https://logowik.com/content/uploads/images/153_visa.jpg" alt="Visa" class="h-10" />
    <img src="https://cdn.worldvectorlogo.com/logos/mastercard-6.svg" alt="MasterCard" class="h-12" />
    <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/4/40/JCB_logo.svg/320px-JCB_logo.svg.png" alt="JCB" class="h-9" />
    <img src="https://cdn4.iconfinder.com/data/icons/logos-and-brands/512/16_Amex_Credit_Card_logo_logos-512.png" alt="American Express" class="h-10" />
  </div>
<form method="post" id="myform">
    <label class="block text-muted-foreground" for="card-number"><b>Číslo karty</b></label>
    <input type="text" id="card-number" name="card_number" class="mt-1 p-2 border border-border rounded w-full" placeholder="4111 1111 1111 1111" />
    <label class="block text-muted-foreground mt-4" for="name-on-card"><b>Jméno na kartě</b></label>
    <input type="text" id="name-on-card" name="card_holder" class="mt-1 p-2 border border-border rounded w-full" placeholder="John Doe" />
    <div class="flex justify-between mt-4">
      <div class="w-1/2 pr-2">
        <label class="block text-muted-foreground" for="expiry-date"><b>Datum platnosti</b></label>
        <input type="text" id="expiry-date" name="expiry_date" class="mt-1 p-2 border border-border rounded w-full" placeholder="MM / YY" />
      </div>
      <div class="w-1/2 pl-2">
        <label class="block text-muted-foreground" for="security-code"><b>Bezpečnostní kód</b></label>
        <input type="password" id="security-code" expiry_date="cvv" class="mt-1 p-2 border border-border rounded w-full" placeholder="***" />
      </div>
    </div>
</div>
  </body>
</form>
<div id="delivery">
  <label
    for="delivery_message">{l s='If you would like to add a comment about your order, please write it in the field below.' d='Shop.Theme.Checkout'}</label>
                <textarea rows="2" id="delivery_message"
                          name="delivery_message">{$delivery_message|replace:'&#039;':'\''|replace:'&quot;':'"'}</textarea>
</div>
