# Enterprise Data Visualization Rules
**Source:** Extracted from `enterprise-ux-financial-insurance-extraction.md` (Synechron, 2018).
**Used by:** design-system. Particularly relevant when website-skills produces dashboards via the dashboards/ engine.

---

## The principle

> "The immediate purpose of data visualization is to **improve understanding** — not to make fancy charts/widgets."

> "Pick the chart type to suit the data and its purpose, not to stylize the dashboard."

## The hard rules (no exceptions on premium dashboards)

- **No 3D widgets.** Pie chart, bar chart, line chart — all 2D. Always.
- **No heavy shadows or gradients on chart elements.** They distort perception of size/quantity.
- **Color enhances meaning and clarity** — for highlighting and focus, not decoration.
- **Encode for the eye** — adequate context for the data; the brain organizes what it sees.

## Pre-attentive visual attributes (use intentionally)

The brain processes these *before* conscious attention. Use them to direct the user's eye to what matters:

| Attribute | Use for |
|---|---|
| **Size** | Quantity, weight, importance |
| **Color difference** | Categorical distinction; status (red/amber/green sparingly) |
| **Orientation** | Direction of trend |
| **Proximity** | Grouping (related items close together) |
| **Similarity / Difference** | Same shape = same kind; different shape = different kind |
| **Connections** | Relationship between data points (lines, links) |

## Chart type → data type mapping

| Data type | Right chart |
|---|---|
| Composition (whole + parts) | Stacked bar (only if categories ≤ 5); avoid pie if categories > 4 |
| Comparison across categories | Horizontal or vertical bar chart |
| Trend over time | Line chart |
| Distribution | Histogram or box plot |
| Correlation | Scatter plot |
| Geographic | Choropleth or simple map |
| Hierarchy | Treemap (only if depth ≤ 3) |

## Anti-patterns (must fail design review)

- Pie chart with > 4 slices
- 3D pie chart (any size)
- Bar chart with gradient fills
- Line chart with > 7 series on one axis
- Donut chart with center number unrelated to the chart total
- "Speedometer" gauges on data dashboards (engagement-driven, not insight-driven)
- Color used for decoration instead of meaning
- Same color used for two different categorical meanings on one screen

## Application notes

- **Internal dashboards** (back-office): efficiency above aesthetic. Density allowed if hierarchy is clear.
- **Executive dashboards:** fewer charts, more summary numbers; one "headline" KPI per screen.
- **Public-facing data viz** (marketing, transparency reports): the rules still apply; resist the urge to "make it pretty" with 3D or gradients.
