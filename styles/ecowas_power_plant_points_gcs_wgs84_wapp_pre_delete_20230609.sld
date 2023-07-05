<?xml version="1.0" encoding="ISO-8859-1"?>
 <StyledLayerDescriptor version="1.0.0"
  xsi:schemaLocation="http://www.opengis.net/sld StyledLayerDescriptor.xsd"
  xmlns="http://www.opengis.net/sld"
  xmlns:ogc="http://www.opengis.net/ogc"
  xmlns:xlink="http://www.w3.org/1999/xlink"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <NamedLayer>
   <Name>Cluster points</Name>
   <UserStyle>
   <!-- Styles can have names, titles and abstracts -->
    <Title>Cluster points</Title>
    <Abstract>Styling using cluster points server side</Abstract>
    <FeatureTypeStyle>
      <Transformation>
        <ogc:Function name="gs:PointStacker">
          <ogc:Function name="parameter">
            <ogc:Literal>data</ogc:Literal>
          </ogc:Function>
          <ogc:Function name="parameter">
            <ogc:Literal>cellSize</ogc:Literal>
            <ogc:Literal>30</ogc:Literal>
          </ogc:Function>
          <ogc:Function name="parameter">
            <ogc:Literal>outputBBOX</ogc:Literal>
            <ogc:Function name="env">
           <ogc:Literal>wms_bbox</ogc:Literal>
            </ogc:Function>
          </ogc:Function>
          <ogc:Function name="parameter">
            <ogc:Literal>outputWidth</ogc:Literal>
            <ogc:Function name="env">
           <ogc:Literal>wms_width</ogc:Literal>
            </ogc:Function>
          </ogc:Function>
          <ogc:Function name="parameter">
            <ogc:Literal>outputHeight</ogc:Literal>
            <ogc:Function name="env">
              <ogc:Literal>wms_height</ogc:Literal>
            </ogc:Function>
          </ogc:Function>
        </ogc:Function>
      </Transformation>
     
     <Rule>
        <Name>ruleGT1</Name>
        <Title>Power Plant Points</Title>
        <ogc:Filter>
          <ogc:PropertyIsGreaterThanOrEqualTo>
            <ogc:PropertyName>count</ogc:PropertyName>
            <ogc:Literal>1</ogc:Literal>
          </ogc:PropertyIsGreaterThanOrEqualTo>
        </ogc:Filter>
	    <MinScaleDenominator>4000000</MinScaleDenominator>
        <PointSymbolizer>
          <Graphic>
            <Mark>
              <WellKnownName>circle</WellKnownName>
              <Fill>
                <CssParameter name="fill">#5E2B2D</CssParameter>
              </Fill>
            </Mark>
            <Size>15</Size>
          </Graphic>
        </PointSymbolizer>
        <TextSymbolizer>
          <Label>
            <ogc:PropertyName>count</ogc:PropertyName>
          </Label>
          <Font>
            <CssParameter name="font-family">Arial</CssParameter>
            <CssParameter name="font-size">10</CssParameter>
            <CssParameter name="font-weight">bold</CssParameter>
          </Font>
          <LabelPlacement>
            <PointPlacement>
              <AnchorPoint>
                <AnchorPointX>0.5</AnchorPointX>
                <AnchorPointY>0.5</AnchorPointY>
              </AnchorPoint>
            </PointPlacement>
          </LabelPlacement>
          <Halo>
             <Radius>0</Radius>
             <Fill>
               <CssParameter name="fill">#000000</CssParameter>
               <CssParameter name="fill-opacity">0.9</CssParameter>
             </Fill>
          </Halo>
          <Fill>
            <CssParameter name="fill">#FFFFFF</CssParameter>
            <CssParameter name="fill-opacity">1.0</CssParameter>
          </Fill>
        </TextSymbolizer>
      </Rule>
	  <Rule>
          <Name>Hydro</Name>
		   <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:And>
              <ogc:And>
                <ogc:PropertyIsEqualTo>
                  <ogc:PropertyName>gentype</ogc:PropertyName>
                  <ogc:Literal>Hydro</ogc:Literal>
                </ogc:PropertyIsEqualTo>
                <ogc:PropertyIsEqualTo>
                  <ogc:PropertyName>type</ogc:PropertyName>
                  <ogc:Literal>Hydro</ogc:Literal>
                </ogc:PropertyIsEqualTo>
              </ogc:And>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>situation</ogc:PropertyName>
                <ogc:Literal>Operational</ogc:Literal>
              </ogc:PropertyIsEqualTo>
            </ogc:And>
          </ogc:Filter>
        <MaxScaleDenominator>4000000</MaxScaleDenominator>
          <PointSymbolizer>
            <Graphic>
              <Mark>
                <WellKnownName>triangle</WellKnownName>
                <Fill>
                  <CssParameter name="fill">#00aaff</CssParameter>
                </Fill>
                <Stroke>
                  <CssParameter name="stroke">#232323</CssParameter>
                  <CssParameter name="stroke-width">0.5</CssParameter>
                </Stroke>
              </Mark>
              <Size>7</Size>
            </Graphic>
          </PointSymbolizer>
        </Rule>
        <Rule>
          <Name>Hydro Future</Name>
	   <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:And>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>gentype</ogc:PropertyName>
                <ogc:Literal>Hydro</ogc:Literal>
              </ogc:PropertyIsEqualTo>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>type</ogc:PropertyName>
                <ogc:Literal>Hydro (Potential)</ogc:Literal>
              </ogc:PropertyIsEqualTo>
            </ogc:And>
          </ogc:Filter>
        <MaxScaleDenominator>4000000</MaxScaleDenominator>
          <PointSymbolizer>
            <Graphic>
              <Mark>
                <WellKnownName>triangle</WellKnownName>
                <Fill>
                  <CssParameter name="fill">#ffffff</CssParameter>
                </Fill>
                <Stroke>
                  <CssParameter name="stroke">#232323</CssParameter>
                  <CssParameter name="stroke-width">0.5</CssParameter>
                </Stroke>
              </Mark>
              <Size>7</Size>
            </Graphic>
          </PointSymbolizer>
        </Rule>
        <Rule>
          <Name>Hydro Project</Name>
	   <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:And>
              <ogc:And>
                <ogc:And>
                  <ogc:PropertyIsEqualTo>
                    <ogc:PropertyName>gentype</ogc:PropertyName>
                    <ogc:Literal>Hydro</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                  <ogc:PropertyIsNotEqualTo>
                    <ogc:PropertyName>type</ogc:PropertyName>
                    <ogc:Literal>Hydro (Potential)</ogc:Literal>
                  </ogc:PropertyIsNotEqualTo>
                </ogc:And>
                <ogc:PropertyIsNotEqualTo>
                  <ogc:PropertyName>type</ogc:PropertyName>
                  <ogc:Literal>Hydro (Reservoir)</ogc:Literal>
                </ogc:PropertyIsNotEqualTo>
              </ogc:And>
              <ogc:PropertyIsNotEqualTo>
                <ogc:PropertyName>situation</ogc:PropertyName>
                <ogc:Literal>Operational</ogc:Literal>
              </ogc:PropertyIsNotEqualTo>
            </ogc:And>
          </ogc:Filter>
        <MaxScaleDenominator>4000000</MaxScaleDenominator>
          <PointSymbolizer>
            <Graphic>
              <Mark>
                <WellKnownName>triangle</WellKnownName>
                <Fill>
                  <CssParameter name="fill">#00ff00</CssParameter>
                </Fill>
                <Stroke>
                  <CssParameter name="stroke">#232323</CssParameter>
                  <CssParameter name="stroke-width">0.5</CssParameter>
                </Stroke>
              </Mark>
              <Size>7</Size>
            </Graphic>
          </PointSymbolizer>
        </Rule>
        <Rule>
          <Name>Thermal</Name>
	   <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:And>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>gentype</ogc:PropertyName>
                <ogc:Literal>Thermal</ogc:Literal>
              </ogc:PropertyIsEqualTo>
              <ogc:PropertyIsNotEqualTo>
                <ogc:PropertyName>situation</ogc:PropertyName>
                <ogc:Literal>Planned</ogc:Literal>
              </ogc:PropertyIsNotEqualTo>
            </ogc:And>
          </ogc:Filter>
        <MaxScaleDenominator>4000000</MaxScaleDenominator>
          <PointSymbolizer>
            <Graphic>
              <Mark>
                <WellKnownName>square</WellKnownName>
                <Fill>
                  <CssParameter name="fill">#000000</CssParameter>
                </Fill>
                <Stroke>
                  <CssParameter name="stroke">#232323</CssParameter>
                  <CssParameter name="stroke-width">0.5</CssParameter>
                </Stroke>
              </Mark>
              <Size>7</Size>
            </Graphic>
          </PointSymbolizer>
        </Rule>
        <Rule>
          <Name>Thermal Future</Name>
	   <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:And>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>gentype</ogc:PropertyName>
                <ogc:Literal>Thermal</ogc:Literal>
              </ogc:PropertyIsEqualTo>
              <ogc:PropertyIsNotEqualTo>
                <ogc:PropertyName>situation</ogc:PropertyName>
                <ogc:Literal>Planned</ogc:Literal>
              </ogc:PropertyIsNotEqualTo>
            </ogc:And>
          </ogc:Filter>
        <MaxScaleDenominator>4000000</MaxScaleDenominator>
          <PointSymbolizer>
            <Graphic>
              <Mark>
                <WellKnownName>square</WellKnownName>
                <Fill>
                  <CssParameter name="fill">#ffffff</CssParameter>
                </Fill>
                <Stroke>
                  <CssParameter name="stroke">#232323</CssParameter>
                  <CssParameter name="stroke-width">0.5</CssParameter>
                </Stroke>
              </Mark>
              <Size>7</Size>
            </Graphic>
          </PointSymbolizer>
        </Rule>
        <Rule>
          <Name>Solar</Name>
	   <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:And>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>gentype</ogc:PropertyName>
                <ogc:Literal>Solar</ogc:Literal>
              </ogc:PropertyIsEqualTo>
              <ogc:PropertyIsNotEqualTo>
                <ogc:PropertyName>situation</ogc:PropertyName>
                <ogc:Literal>Planned</ogc:Literal>
              </ogc:PropertyIsNotEqualTo>
            </ogc:And>
          </ogc:Filter>
        <MaxScaleDenominator>4000000</MaxScaleDenominator>
          <PointSymbolizer>
            <Graphic>
              <Mark>
                <WellKnownName>star</WellKnownName>
                <Fill>
                  <CssParameter name="fill">#ffff00</CssParameter>
                </Fill>
                <Stroke>
                  <CssParameter name="stroke">#232323</CssParameter>
                  <CssParameter name="stroke-width">0.5</CssParameter>
                </Stroke>
              </Mark>
              <Size>11</Size>
            </Graphic>
          </PointSymbolizer>
        </Rule>
        <Rule>
          <Name>Solar Future</Name>
	   <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:And>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>gentype</ogc:PropertyName>
                <ogc:Literal>Solar</ogc:Literal>
              </ogc:PropertyIsEqualTo>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>situation</ogc:PropertyName>
                <ogc:Literal>Planned</ogc:Literal>
              </ogc:PropertyIsEqualTo>
            </ogc:And>
          </ogc:Filter>
        <MaxScaleDenominator>4000000</MaxScaleDenominator>
          <PointSymbolizer>
            <Graphic>
              <Mark>
                <WellKnownName>star</WellKnownName>
                <Fill>
                  <CssParameter name="fill">#ffffff</CssParameter>
                </Fill>
                <Stroke>
                  <CssParameter name="stroke">#232323</CssParameter>
                  <CssParameter name="stroke-width">0.5</CssParameter>
                </Stroke>
              </Mark>
              <Size>11</Size>
            </Graphic>
          </PointSymbolizer>
        </Rule>
        <Rule>
          <Name>Wind</Name>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
	   <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>gentype</ogc:PropertyName>
              <ogc:Literal>Wind</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
        <MaxScaleDenominator>4000000</MaxScaleDenominator>
          <PointSymbolizer>
            <Graphic>
              <Mark>
                <WellKnownName>pentagon</WellKnownName>
                <Fill>
                  <CssParameter name="fill">#ffffff</CssParameter>
                </Fill>
                <Stroke>
                  <CssParameter name="stroke">#232323</CssParameter>
                  <CssParameter name="stroke-width">0.5</CssParameter>
                </Stroke>
              </Mark>
              <Size>11</Size>
            </Graphic>
          </PointSymbolizer>
        </Rule>
        <Rule>
          <Name>Other</Name>
	   <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:And>
              <ogc:And>
                <ogc:And>
                  <ogc:PropertyIsNotEqualTo>
                    <ogc:PropertyName>gentype</ogc:PropertyName>
                    <ogc:Literal>Hydro</ogc:Literal>
                  </ogc:PropertyIsNotEqualTo>
                  <ogc:PropertyIsNotEqualTo>
                    <ogc:PropertyName>gentype</ogc:PropertyName>
                    <ogc:Literal>Thermal</ogc:Literal>
                  </ogc:PropertyIsNotEqualTo>
                </ogc:And>
                <ogc:PropertyIsNotEqualTo>
                  <ogc:PropertyName>gentype</ogc:PropertyName>
                  <ogc:Literal>Solar</ogc:Literal>
                </ogc:PropertyIsNotEqualTo>
              </ogc:And>
              <ogc:PropertyIsNotEqualTo>
                <ogc:PropertyName>gentype</ogc:PropertyName>
                <ogc:Literal>Wind</ogc:Literal>
              </ogc:PropertyIsNotEqualTo>
            </ogc:And>
          </ogc:Filter>
        <MaxScaleDenominator>4000000</MaxScaleDenominator>
          <PointSymbolizer>
            <Graphic>
              <Mark>
                <WellKnownName>circle</WellKnownName>
                <Fill>
                  <CssParameter name="fill">#ff9e17</CssParameter>
                </Fill>
                <Stroke>
                  <CssParameter name="stroke">#232323</CssParameter>
                  <CssParameter name="stroke-width">0.5</CssParameter>
                </Stroke>
              </Mark>
              <Size>7</Size>
            </Graphic>
          </PointSymbolizer>
        </Rule>
    </FeatureTypeStyle>
  </UserStyle>
 </NamedLayer>
</StyledLayerDescriptor>
