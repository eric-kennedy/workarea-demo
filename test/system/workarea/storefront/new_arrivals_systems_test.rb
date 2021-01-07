require 'test_helper'

module Workarea
  module Storefront
    class NewArrivalsSystemTest < Workarea::SystemTest
      setup :set_product

      def set_product
        @product = create_product(
            name: 'Integration Product',
            variants: [
              { sku: 'SKU1', regular: 10.to_m, new_arrival: true },
              { sku: 'SKU2', regular: 20.to_m, new_arrival: false }
            ]
          )
      end

      def test_showing_a_product_with_new_arrivals
        visit storefront.product_path(@product)
        assert(page.has_content?('New Arrival'))

        visit storefront.product_path(@product, sku: 'SKU2')
        refute(page.has_content?('New Arrival'))
      end
    end
  end
end