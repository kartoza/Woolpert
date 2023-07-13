<?xml version="1.0" encoding="UTF-8"?>
<StyledLayerDescriptor xmlns="http://www.opengis.net/sld" version="1.1.0" xmlns:ogc="http://www.opengis.net/ogc" xmlns:se="http://www.opengis.net/se" xsi:schemaLocation="http://www.opengis.net/sld http://schemas.opengis.net/sld/1.1.0/StyledLayerDescriptor.xsd" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <NamedLayer>
    <se:Name>ecowas_power_lines_gcs_wgs84_wapp</se:Name>
    <UserStyle>
      <se:Name>ecowas_power_lines_gcs_wgs84_wapp</se:Name>
      <se:FeatureTypeStyle>
        <se:Rule>
          <se:Name>110 Existing11</se:Name>
          <se:Description>
            <se:Title>110 Existing11</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:And>
              <ogc:And>
                <ogc:And>
                  <ogc:PropertyIsEqualTo>
                    <ogc:Function name="max">
                      <ogc:PropertyName>voltage_kv</ogc:PropertyName>
                      <ogc:Literal>36</ogc:Literal>
                    </ogc:Function>
                    <ogc:Literal>110</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                  <ogc:PropertyIsEqualTo>
                    <ogc:PropertyName>situation</ogc:PropertyName>
                    <ogc:Literal>Existing</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                </ogc:And>
                <ogc:PropertyIsEqualTo>
                  <ogc:PropertyName>c_design</ogc:PropertyName>
                  <ogc:Literal>1</ogc:Literal>
                </ogc:PropertyIsEqualTo>
              </ogc:And>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>c_inst</ogc:PropertyName>
                <ogc:Literal>1</ogc:Literal>
              </ogc:PropertyIsEqualTo>
            </ogc:And>
          </ogc:Filter>
          <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#ffaa00</se:SvgParameter>
              <se:SvgParameter name="stroke-width">3</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
              <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>110 Existing22</se:Name>
          <se:Description>
            <se:Title>110 Existing22</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:And>
              <ogc:And>
                <ogc:And>
                  <ogc:PropertyIsEqualTo>
                    <ogc:Function name="max">
                      <ogc:PropertyName>voltage_kv</ogc:PropertyName>
                      <ogc:Literal>36</ogc:Literal>
                    </ogc:Function>
                    <ogc:Literal>110</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                  <ogc:PropertyIsEqualTo>
                    <ogc:PropertyName>situation</ogc:PropertyName>
                    <ogc:Literal>Existing</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                </ogc:And>
                <ogc:PropertyIsEqualTo>
                  <ogc:PropertyName>c_design</ogc:PropertyName>
                  <ogc:Literal>2</ogc:Literal>
                </ogc:PropertyIsEqualTo>
              </ogc:And>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>c_inst</ogc:PropertyName>
                <ogc:Literal>2</ogc:Literal>
              </ogc:PropertyIsEqualTo>
            </ogc:And>
          </ogc:Filter>
          <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#ffaa00</se:SvgParameter>
              <se:SvgParameter name="stroke-width">3</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
              <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>
          <se:LineSymbolizer>
            <se:Stroke>
              <se:GraphicStroke>
                <se:Graphic>
                  <se:Mark>
                    <se:WellKnownName>square</se:WellKnownName>
                    <se:Fill>
                      <se:SvgParameter name="fill">#ffaa00</se:SvgParameter>
                    </se:Fill>
                    <se:Stroke>
                       <se:SvgParameter name="stroke">#00ff00</se:SvgParameter>
                       <se:SvgParameter name="stroke-width">0</se:SvgParameter>
                    </se:Stroke>
                  </se:Mark>
                  <se:Size>4</se:Size>
                  <se:Displacement>
                    <se:DisplacementX>0</se:DisplacementX>
                    <se:DisplacementY>4</se:DisplacementY>
                  </se:Displacement>
                </se:Graphic>
              </se:GraphicStroke>
              <se:SvgParameter name="stroke-dasharray">4 12</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>132 Existing0</se:Name>
          <se:Description>
            <se:Title>132 Existing0</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:And>
              <ogc:And>
                <ogc:And>
                  <ogc:PropertyIsEqualTo>
                    <ogc:Function name="max">
                      <ogc:PropertyName>voltage_kv</ogc:PropertyName>
                      <ogc:Literal>36</ogc:Literal>
                    </ogc:Function>
                    <ogc:Literal>132</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                  <ogc:PropertyIsEqualTo>
                    <ogc:PropertyName>situation</ogc:PropertyName>
                    <ogc:Literal>Existing</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                </ogc:And>
                <ogc:PropertyIsNull>
                  <ogc:PropertyName>c_design</ogc:PropertyName>
                </ogc:PropertyIsNull>
              </ogc:And>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>c_inst</ogc:PropertyName>
                <ogc:Literal>0</ogc:Literal>
              </ogc:PropertyIsEqualTo>
            </ogc:And>
          </ogc:Filter>
          <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#8698e7</se:SvgParameter>
              <se:SvgParameter name="stroke-width">1</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
              <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>132 Existing11</se:Name>
          <se:Description>
            <se:Title>132 Existing11</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:And>
              <ogc:And>
                <ogc:And>
                  <ogc:PropertyIsEqualTo>
                    <ogc:Function name="max">
                      <ogc:PropertyName>voltage_kv</ogc:PropertyName>
                      <ogc:Literal>36</ogc:Literal>
                    </ogc:Function>
                    <ogc:Literal>132</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                  <ogc:PropertyIsEqualTo>
                    <ogc:PropertyName>situation</ogc:PropertyName>
                    <ogc:Literal>Existing</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                </ogc:And>
                <ogc:PropertyIsEqualTo>
                  <ogc:PropertyName>c_design</ogc:PropertyName>
                  <ogc:Literal>1</ogc:Literal>
                </ogc:PropertyIsEqualTo>
              </ogc:And>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>c_inst</ogc:PropertyName>
                <ogc:Literal>1</ogc:Literal>
              </ogc:PropertyIsEqualTo>
            </ogc:And>
          </ogc:Filter>
          <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#00aa00</se:SvgParameter>
              <se:SvgParameter name="stroke-width">2</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
              <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>132 Existing20</se:Name>
          <se:Description>
            <se:Title>132 Existing20</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:And>
              <ogc:And>
                <ogc:And>
                  <ogc:PropertyIsEqualTo>
                    <ogc:Function name="max">
                      <ogc:PropertyName>voltage_kv</ogc:PropertyName>
                      <ogc:Literal>36</ogc:Literal>
                    </ogc:Function>
                    <ogc:Literal>132</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                  <ogc:PropertyIsEqualTo>
                    <ogc:PropertyName>situation</ogc:PropertyName>
                    <ogc:Literal>Existing</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                </ogc:And>
                <ogc:PropertyIsEqualTo>
                  <ogc:PropertyName>c_design</ogc:PropertyName>
                  <ogc:Literal>2</ogc:Literal>
                </ogc:PropertyIsEqualTo>
              </ogc:And>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>c_inst</ogc:PropertyName>
                <ogc:Literal>0</ogc:Literal>
              </ogc:PropertyIsEqualTo>
            </ogc:And>
          </ogc:Filter>
          <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#c1cd1b</se:SvgParameter>
              <se:SvgParameter name="stroke-width">1</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
              <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>132 Existing22</se:Name>
          <se:Description>
            <se:Title>132 Existing22</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:And>
              <ogc:And>
                <ogc:And>
                  <ogc:PropertyIsEqualTo>
                    <ogc:Function name="max">
                      <ogc:PropertyName>voltage_kv</ogc:PropertyName>
                      <ogc:Literal>36</ogc:Literal>
                    </ogc:Function>
                    <ogc:Literal>132</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                  <ogc:PropertyIsEqualTo>
                    <ogc:PropertyName>situation</ogc:PropertyName>
                    <ogc:Literal>Existing</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                </ogc:And>
                <ogc:PropertyIsEqualTo>
                  <ogc:PropertyName>c_design</ogc:PropertyName>
                  <ogc:Literal>2</ogc:Literal>
                </ogc:PropertyIsEqualTo>
              </ogc:And>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>c_inst</ogc:PropertyName>
                <ogc:Literal>2</ogc:Literal>
              </ogc:PropertyIsEqualTo>
            </ogc:And>
          </ogc:Filter>
          <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#00aa00</se:SvgParameter>
              <se:SvgParameter name="stroke-width">2</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
              <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>
          <se:LineSymbolizer>
            <se:Stroke>
              <se:GraphicStroke>
                <se:Graphic>
                  <se:Mark>
                    <se:WellKnownName>square</se:WellKnownName>
                    <se:Fill>
                      <se:SvgParameter name="fill">#00aa00</se:SvgParameter>
                    </se:Fill>
                    <se:Stroke>
                       <se:SvgParameter name="stroke">#00aa00</se:SvgParameter>
                       <se:SvgParameter name="stroke-width">0</se:SvgParameter>
                    </se:Stroke>
                  </se:Mark>
                  <se:Size>4</se:Size>
                  <se:Displacement>
                    <se:DisplacementX>0</se:DisplacementX>
                    <se:DisplacementY>4</se:DisplacementY>
                  </se:Displacement>
                </se:Graphic>
              </se:GraphicStroke>
              <se:SvgParameter name="stroke-dasharray">4 8</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>132 Existing33</se:Name>
          <se:Description>
            <se:Title>132 Existing33</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:And>
              <ogc:And>
                <ogc:And>
                  <ogc:PropertyIsEqualTo>
                    <ogc:Function name="max">
                      <ogc:PropertyName>voltage_kv</ogc:PropertyName>
                      <ogc:Literal>36</ogc:Literal>
                    </ogc:Function>
                    <ogc:Literal>132</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                  <ogc:PropertyIsEqualTo>
                    <ogc:PropertyName>situation</ogc:PropertyName>
                    <ogc:Literal>Existing</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                </ogc:And>
                <ogc:PropertyIsEqualTo>
                  <ogc:PropertyName>c_design</ogc:PropertyName>
                  <ogc:Literal>3</ogc:Literal>
                </ogc:PropertyIsEqualTo>
              </ogc:And>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>c_inst</ogc:PropertyName>
                <ogc:Literal>3</ogc:Literal>
              </ogc:PropertyIsEqualTo>
            </ogc:And>
          </ogc:Filter>
          <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#00aa00</se:SvgParameter>
              <se:SvgParameter name="stroke-width">3</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
              <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>
          <se:LineSymbolizer>
            <se:Stroke>
              <se:GraphicStroke>
                <se:Graphic>
                  <se:Mark>
                    <se:WellKnownName>square</se:WellKnownName>
                    <se:Fill>
                      <se:SvgParameter name="fill">#00aa00</se:SvgParameter>
                    </se:Fill>
                    <se:Stroke>
                       <se:SvgParameter name="stroke">#00aa00</se:SvgParameter>
                       <se:SvgParameter name="stroke-width">0</se:SvgParameter>
                    </se:Stroke>
                  </se:Mark>
                  <se:Size>6</se:Size>
                  <se:Displacement>
                    <se:DisplacementX>0</se:DisplacementX>
                    <se:DisplacementY>6</se:DisplacementY>
                  </se:Displacement>
                </se:Graphic>
              </se:GraphicStroke>
              <se:SvgParameter name="stroke-dasharray">6 12</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>132 Future0</se:Name>
          <se:Description>
            <se:Title>132 Future0</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:And>
              <ogc:And>
                <ogc:And>
                  <ogc:PropertyIsEqualTo>
                    <ogc:Function name="max">
                      <ogc:PropertyName>voltage_kv</ogc:PropertyName>
                      <ogc:Literal>36</ogc:Literal>
                    </ogc:Function>
                    <ogc:Literal>132</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                  <ogc:PropertyIsEqualTo>
                    <ogc:PropertyName>situation</ogc:PropertyName>
                    <ogc:Literal>Future</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                </ogc:And>
                <ogc:PropertyIsNull>
                  <ogc:PropertyName>c_design</ogc:PropertyName>
                </ogc:PropertyIsNull>
              </ogc:And>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>c_inst</ogc:PropertyName>
                <ogc:Literal>0</ogc:Literal>
              </ogc:PropertyIsEqualTo>
            </ogc:And>
          </ogc:Filter>
          <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#65ed16</se:SvgParameter>
              <se:SvgParameter name="stroke-width">1</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
              <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>132 Future11</se:Name>
          <se:Description>
            <se:Title>132 Future11</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:And>
              <ogc:And>
                <ogc:And>
                  <ogc:PropertyIsEqualTo>
                    <ogc:Function name="max">
                      <ogc:PropertyName>voltage_kv</ogc:PropertyName>
                      <ogc:Literal>36</ogc:Literal>
                    </ogc:Function>
                    <ogc:Literal>132</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                  <ogc:PropertyIsEqualTo>
                    <ogc:PropertyName>situation</ogc:PropertyName>
                    <ogc:Literal>Future</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                </ogc:And>
                <ogc:PropertyIsEqualTo>
                  <ogc:PropertyName>c_design</ogc:PropertyName>
                  <ogc:Literal>1</ogc:Literal>
                </ogc:PropertyIsEqualTo>
              </ogc:And>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>c_inst</ogc:PropertyName>
                <ogc:Literal>1</ogc:Literal>
              </ogc:PropertyIsEqualTo>
            </ogc:And>
          </ogc:Filter>
          <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#00aa00</se:SvgParameter>
              <se:SvgParameter name="stroke-width">2</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
              <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
              <se:SvgParameter name="stroke-dasharray">8 6</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>132 Future21</se:Name>
          <se:Description>
            <se:Title>132 Future21</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:And>
              <ogc:And>
                <ogc:And>
                  <ogc:PropertyIsEqualTo>
                    <ogc:Function name="max">
                      <ogc:PropertyName>voltage_kv</ogc:PropertyName>
                      <ogc:Literal>36</ogc:Literal>
                    </ogc:Function>
                    <ogc:Literal>132</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                  <ogc:PropertyIsEqualTo>
                    <ogc:PropertyName>situation</ogc:PropertyName>
                    <ogc:Literal>Future</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                </ogc:And>
                <ogc:PropertyIsEqualTo>
                  <ogc:PropertyName>c_design</ogc:PropertyName>
                  <ogc:Literal>2</ogc:Literal>
                </ogc:PropertyIsEqualTo>
              </ogc:And>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>c_inst</ogc:PropertyName>
                <ogc:Literal>1</ogc:Literal>
              </ogc:PropertyIsEqualTo>
            </ogc:And>
          </ogc:Filter>
          <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#00aa00</se:SvgParameter>
              <se:SvgParameter name="stroke-width">2</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
              <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
              <se:SvgParameter name="stroke-dasharray">8 6</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>
          <se:LineSymbolizer>
            <se:Stroke>
              <se:GraphicStroke>
                <se:Graphic>
                  <se:Mark>
                    <se:WellKnownName>circle</se:WellKnownName>
                    <se:Fill>
                      <se:SvgParameter name="fill">#00aa00</se:SvgParameter>
                    </se:Fill>
                    <se:Stroke>
                       <se:SvgParameter name="stroke">#00aa00</se:SvgParameter>
                       <se:SvgParameter name="stroke-width">0</se:SvgParameter>
                    </se:Stroke>
                  </se:Mark>
                  <se:Size>4</se:Size>
                  <se:Displacement>
                    <se:DisplacementX>0</se:DisplacementX>
                    <se:DisplacementY>8</se:DisplacementY>
                  </se:Displacement>
                </se:Graphic>
              </se:GraphicStroke>
              <se:SvgParameter name="stroke-dasharray">4 12</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>132 Future22</se:Name>
          <se:Description>
            <se:Title>132 Future22</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:And>
              <ogc:And>
                <ogc:And>
                  <ogc:PropertyIsEqualTo>
                    <ogc:Function name="max">
                      <ogc:PropertyName>voltage_kv</ogc:PropertyName>
                      <ogc:Literal>36</ogc:Literal>
                    </ogc:Function>
                    <ogc:Literal>132</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                  <ogc:PropertyIsEqualTo>
                    <ogc:PropertyName>situation</ogc:PropertyName>
                    <ogc:Literal>Future</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                </ogc:And>
                <ogc:PropertyIsEqualTo>
                  <ogc:PropertyName>c_design</ogc:PropertyName>
                  <ogc:Literal>2</ogc:Literal>
                </ogc:PropertyIsEqualTo>
              </ogc:And>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>c_inst</ogc:PropertyName>
                <ogc:Literal>2</ogc:Literal>
              </ogc:PropertyIsEqualTo>
            </ogc:And>
          </ogc:Filter>
          <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#00aa00</se:SvgParameter>
              <se:SvgParameter name="stroke-width">2</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
              <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
              <se:SvgParameter name="stroke-dasharray">8 6</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>
          <se:LineSymbolizer>
            <se:Stroke>
              <se:GraphicStroke>
                <se:Graphic>
                  <se:Mark>
                    <se:WellKnownName>square</se:WellKnownName>
                    <se:Fill>
                      <se:SvgParameter name="fill">#00aa00</se:SvgParameter>
                    </se:Fill>
                    <se:Stroke>
                       <se:SvgParameter name="stroke">#00aa00</se:SvgParameter>
                       <se:SvgParameter name="stroke-width">0</se:SvgParameter>
                    </se:Stroke>
                  </se:Mark>
                  <se:Size>4</se:Size>
                  <se:Displacement>
                    <se:DisplacementX>0</se:DisplacementX>
                    <se:DisplacementY>4</se:DisplacementY>
                  </se:Displacement>
                </se:Graphic>
              </se:GraphicStroke>
              <se:SvgParameter name="stroke-dasharray">4 12</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>150 Existing0</se:Name>
          <se:Description>
            <se:Title>150 Existing0</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:And>
              <ogc:And>
                <ogc:And>
                  <ogc:PropertyIsEqualTo>
                    <ogc:Function name="max">
                      <ogc:PropertyName>voltage_kv</ogc:PropertyName>
                      <ogc:Literal>36</ogc:Literal>
                    </ogc:Function>
                    <ogc:Literal>150</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                  <ogc:PropertyIsEqualTo>
                    <ogc:PropertyName>situation</ogc:PropertyName>
                    <ogc:Literal>Existing</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                </ogc:And>
                <ogc:PropertyIsNull>
                  <ogc:PropertyName>c_design</ogc:PropertyName>
                </ogc:PropertyIsNull>
              </ogc:And>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>c_inst</ogc:PropertyName>
                <ogc:Literal>0</ogc:Literal>
              </ogc:PropertyIsEqualTo>
            </ogc:And>
          </ogc:Filter>
          <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#86d12a</se:SvgParameter>
              <se:SvgParameter name="stroke-width">1</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
              <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>150 Existing11</se:Name>
          <se:Description>
            <se:Title>150 Existing11</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:And>
              <ogc:And>
                <ogc:And>
                  <ogc:PropertyIsEqualTo>
                    <ogc:Function name="max">
                      <ogc:PropertyName>voltage_kv</ogc:PropertyName>
                      <ogc:Literal>36</ogc:Literal>
                    </ogc:Function>
                    <ogc:Literal>150</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                  <ogc:PropertyIsEqualTo>
                    <ogc:PropertyName>situation</ogc:PropertyName>
                    <ogc:Literal>Existing</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                </ogc:And>
                <ogc:PropertyIsEqualTo>
                  <ogc:PropertyName>c_design</ogc:PropertyName>
                  <ogc:Literal>1</ogc:Literal>
                </ogc:PropertyIsEqualTo>
              </ogc:And>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>c_inst</ogc:PropertyName>
                <ogc:Literal>1</ogc:Literal>
              </ogc:PropertyIsEqualTo>
            </ogc:And>
          </ogc:Filter>
          <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#ffff00</se:SvgParameter>
              <se:SvgParameter name="stroke-width">3</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
              <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>150 Existing22</se:Name>
          <se:Description>
            <se:Title>150 Existing22</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:And>
              <ogc:And>
                <ogc:And>
                  <ogc:PropertyIsEqualTo>
                    <ogc:Function name="max">
                      <ogc:PropertyName>voltage_kv</ogc:PropertyName>
                      <ogc:Literal>36</ogc:Literal>
                    </ogc:Function>
                    <ogc:Literal>150</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                  <ogc:PropertyIsEqualTo>
                    <ogc:PropertyName>situation</ogc:PropertyName>
                    <ogc:Literal>Existing</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                </ogc:And>
                <ogc:PropertyIsEqualTo>
                  <ogc:PropertyName>c_design</ogc:PropertyName>
                  <ogc:Literal>2</ogc:Literal>
                </ogc:PropertyIsEqualTo>
              </ogc:And>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>c_inst</ogc:PropertyName>
                <ogc:Literal>2</ogc:Literal>
              </ogc:PropertyIsEqualTo>
            </ogc:And>
          </ogc:Filter>
          <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#ffff00</se:SvgParameter>
              <se:SvgParameter name="stroke-width">3</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
              <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>
          <se:LineSymbolizer>
            <se:Stroke>
              <se:GraphicStroke>
                <se:Graphic>
                  <se:Mark>
                    <se:WellKnownName>square</se:WellKnownName>
                    <se:Fill>
                      <se:SvgParameter name="fill">#ffff00</se:SvgParameter>
                    </se:Fill>
                    <se:Stroke>
                       <se:SvgParameter name="stroke">#ffff00</se:SvgParameter>
                       <se:SvgParameter name="stroke-width">0</se:SvgParameter>
                    </se:Stroke>
                  </se:Mark>
                  <se:Size>6</se:Size>
                  <se:Displacement>
                    <se:DisplacementX>0</se:DisplacementX>
                    <se:DisplacementY>6</se:DisplacementY>
                  </se:Displacement>
                </se:Graphic>
              </se:GraphicStroke>
              <se:SvgParameter name="stroke-dasharray">6 12</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>161 Existing0</se:Name>
          <se:Description>
            <se:Title>161 Existing0</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:And>
              <ogc:And>
                <ogc:And>
                  <ogc:PropertyIsEqualTo>
                    <ogc:Function name="max">
                      <ogc:PropertyName>voltage_kv</ogc:PropertyName>
                      <ogc:Literal>36</ogc:Literal>
                    </ogc:Function>
                    <ogc:Literal>161</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                  <ogc:PropertyIsEqualTo>
                    <ogc:PropertyName>situation</ogc:PropertyName>
                    <ogc:Literal>Existing</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                </ogc:And>
                <ogc:PropertyIsNull>
                  <ogc:PropertyName>c_design</ogc:PropertyName>
                </ogc:PropertyIsNull>
              </ogc:And>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>c_inst</ogc:PropertyName>
                <ogc:Literal>0</ogc:Literal>
              </ogc:PropertyIsEqualTo>
            </ogc:And>
          </ogc:Filter>
          <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#50e1c2</se:SvgParameter>
              <se:SvgParameter name="stroke-width">1</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
              <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>161 Existing00</se:Name>
          <se:Description>
            <se:Title>161 Existing00</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:And>
              <ogc:And>
                <ogc:And>
                  <ogc:PropertyIsEqualTo>
                    <ogc:Function name="max">
                      <ogc:PropertyName>voltage_kv</ogc:PropertyName>
                      <ogc:Literal>36</ogc:Literal>
                    </ogc:Function>
                    <ogc:Literal>161</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                  <ogc:PropertyIsEqualTo>
                    <ogc:PropertyName>situation</ogc:PropertyName>
                    <ogc:Literal>Existing</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                </ogc:And>
                <ogc:PropertyIsEqualTo>
                  <ogc:PropertyName>c_design</ogc:PropertyName>
                  <ogc:Literal>0</ogc:Literal>
                </ogc:PropertyIsEqualTo>
              </ogc:And>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>c_inst</ogc:PropertyName>
                <ogc:Literal>0</ogc:Literal>
              </ogc:PropertyIsEqualTo>
            </ogc:And>
          </ogc:Filter>
          <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#df1a9d</se:SvgParameter>
              <se:SvgParameter name="stroke-width">1</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
              <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>161 Existing11</se:Name>
          <se:Description>
            <se:Title>161 Existing11</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:And>
              <ogc:And>
                <ogc:And>
                  <ogc:PropertyIsEqualTo>
                    <ogc:Function name="max">
                      <ogc:PropertyName>voltage_kv</ogc:PropertyName>
                      <ogc:Literal>36</ogc:Literal>
                    </ogc:Function>
                    <ogc:Literal>161</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                  <ogc:PropertyIsEqualTo>
                    <ogc:PropertyName>situation</ogc:PropertyName>
                    <ogc:Literal>Existing</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                </ogc:And>
                <ogc:PropertyIsEqualTo>
                  <ogc:PropertyName>c_design</ogc:PropertyName>
                  <ogc:Literal>1</ogc:Literal>
                </ogc:PropertyIsEqualTo>
              </ogc:And>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>c_inst</ogc:PropertyName>
                <ogc:Literal>1</ogc:Literal>
              </ogc:PropertyIsEqualTo>
            </ogc:And>
          </ogc:Filter>
          <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#00ff00</se:SvgParameter>
              <se:SvgParameter name="stroke-width">2</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
              <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>161 Existing2</se:Name>
          <se:Description>
            <se:Title>161 Existing2</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:And>
              <ogc:And>
                <ogc:And>
                  <ogc:PropertyIsEqualTo>
                    <ogc:Function name="max">
                      <ogc:PropertyName>voltage_kv</ogc:PropertyName>
                      <ogc:Literal>36</ogc:Literal>
                    </ogc:Function>
                    <ogc:Literal>161</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                  <ogc:PropertyIsEqualTo>
                    <ogc:PropertyName>situation</ogc:PropertyName>
                    <ogc:Literal>Existing</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                </ogc:And>
                <ogc:PropertyIsNull>
                  <ogc:PropertyName>c_design</ogc:PropertyName>
                </ogc:PropertyIsNull>
              </ogc:And>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>c_inst</ogc:PropertyName>
                <ogc:Literal>2</ogc:Literal>
              </ogc:PropertyIsEqualTo>
            </ogc:And>
          </ogc:Filter>
          <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#66ea4b</se:SvgParameter>
              <se:SvgParameter name="stroke-width">1</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
              <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>161 Existing22</se:Name>
          <se:Description>
            <se:Title>161 Existing22</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:And>
              <ogc:And>
                <ogc:And>
                  <ogc:PropertyIsEqualTo>
                    <ogc:Function name="max">
                      <ogc:PropertyName>voltage_kv</ogc:PropertyName>
                      <ogc:Literal>36</ogc:Literal>
                    </ogc:Function>
                    <ogc:Literal>161</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                  <ogc:PropertyIsEqualTo>
                    <ogc:PropertyName>situation</ogc:PropertyName>
                    <ogc:Literal>Existing</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                </ogc:And>
                <ogc:PropertyIsEqualTo>
                  <ogc:PropertyName>c_design</ogc:PropertyName>
                  <ogc:Literal>2</ogc:Literal>
                </ogc:PropertyIsEqualTo>
              </ogc:And>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>c_inst</ogc:PropertyName>
                <ogc:Literal>2</ogc:Literal>
              </ogc:PropertyIsEqualTo>
            </ogc:And>
          </ogc:Filter>
          <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#00ff00</se:SvgParameter>
              <se:SvgParameter name="stroke-width">2</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
              <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>
          <se:LineSymbolizer>
            <se:Stroke>
              <se:GraphicStroke>
                <se:Graphic>
                  <se:Mark>
                    <se:WellKnownName>square</se:WellKnownName>
                    <se:Fill>
                      <se:SvgParameter name="fill">#00ff00</se:SvgParameter>
                    </se:Fill>
                    <se:Stroke>
                       <se:SvgParameter name="stroke">#00ff00</se:SvgParameter>
                       <se:SvgParameter name="stroke-width">0</se:SvgParameter>
                    </se:Stroke>
                  </se:Mark>
                  <se:Size>4</se:Size>
                  <se:Displacement>
                    <se:DisplacementX>0</se:DisplacementX>
                    <se:DisplacementY>4</se:DisplacementY>
                  </se:Displacement>
                </se:Graphic>
              </se:GraphicStroke>
              <se:SvgParameter name="stroke-dasharray">4 8</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>161 Future1</se:Name>
          <se:Description>
            <se:Title>161 Future1</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:And>
              <ogc:And>
                <ogc:And>
                  <ogc:PropertyIsEqualTo>
                    <ogc:Function name="max">
                      <ogc:PropertyName>voltage_kv</ogc:PropertyName>
                      <ogc:Literal>36</ogc:Literal>
                    </ogc:Function>
                    <ogc:Literal>161</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                  <ogc:PropertyIsEqualTo>
                    <ogc:PropertyName>situation</ogc:PropertyName>
                    <ogc:Literal>Future</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                </ogc:And>
                <ogc:PropertyIsNull>
                  <ogc:PropertyName>c_design</ogc:PropertyName>
                </ogc:PropertyIsNull>
              </ogc:And>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>c_inst</ogc:PropertyName>
                <ogc:Literal>1</ogc:Literal>
              </ogc:PropertyIsEqualTo>
            </ogc:And>
          </ogc:Filter>
          <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#d44130</se:SvgParameter>
              <se:SvgParameter name="stroke-width">1</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
              <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>161 Future11</se:Name>
          <se:Description>
            <se:Title>161 Future11</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:And>
              <ogc:And>
                <ogc:And>
                  <ogc:PropertyIsEqualTo>
                    <ogc:Function name="max">
                      <ogc:PropertyName>voltage_kv</ogc:PropertyName>
                      <ogc:Literal>36</ogc:Literal>
                    </ogc:Function>
                    <ogc:Literal>161</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                  <ogc:PropertyIsEqualTo>
                    <ogc:PropertyName>situation</ogc:PropertyName>
                    <ogc:Literal>Future</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                </ogc:And>
                <ogc:PropertyIsEqualTo>
                  <ogc:PropertyName>c_design</ogc:PropertyName>
                  <ogc:Literal>1</ogc:Literal>
                </ogc:PropertyIsEqualTo>
              </ogc:And>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>c_inst</ogc:PropertyName>
                <ogc:Literal>1</ogc:Literal>
              </ogc:PropertyIsEqualTo>
            </ogc:And>
          </ogc:Filter>
          <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#00ff00</se:SvgParameter>
              <se:SvgParameter name="stroke-width">2</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
              <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
              <se:SvgParameter name="stroke-dasharray">8 6</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>161 Future22</se:Name>
          <se:Description>
            <se:Title>161 Future22</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:And>
              <ogc:And>
                <ogc:And>
                  <ogc:PropertyIsEqualTo>
                    <ogc:Function name="max">
                      <ogc:PropertyName>voltage_kv</ogc:PropertyName>
                      <ogc:Literal>36</ogc:Literal>
                    </ogc:Function>
                    <ogc:Literal>161</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                  <ogc:PropertyIsEqualTo>
                    <ogc:PropertyName>situation</ogc:PropertyName>
                    <ogc:Literal>Future</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                </ogc:And>
                <ogc:PropertyIsEqualTo>
                  <ogc:PropertyName>c_design</ogc:PropertyName>
                  <ogc:Literal>2</ogc:Literal>
                </ogc:PropertyIsEqualTo>
              </ogc:And>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>c_inst</ogc:PropertyName>
                <ogc:Literal>2</ogc:Literal>
              </ogc:PropertyIsEqualTo>
            </ogc:And>
          </ogc:Filter>
          <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#00ff00</se:SvgParameter>
              <se:SvgParameter name="stroke-width">2</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
              <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
              <se:SvgParameter name="stroke-dasharray">8 6</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>
          <se:LineSymbolizer>
            <se:Stroke>
              <se:GraphicStroke>
                <se:Graphic>
                  <se:Mark>
                    <se:WellKnownName>square</se:WellKnownName>
                    <se:Fill>
                      <se:SvgParameter name="fill">#00ff00</se:SvgParameter>
                    </se:Fill>
                    <se:Stroke>
                       <se:SvgParameter name="stroke">#00ff00</se:SvgParameter>
                       <se:SvgParameter name="stroke-width">0</se:SvgParameter>
                    </se:Stroke>
                  </se:Mark>
                  <se:Size>4</se:Size>
                  <se:Displacement>
                    <se:DisplacementX>0</se:DisplacementX>
                    <se:DisplacementY>4</se:DisplacementY>
                  </se:Displacement>
                </se:Graphic>
              </se:GraphicStroke>
              <se:SvgParameter name="stroke-dasharray">4 12</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>225 Existing0</se:Name>
          <se:Description>
            <se:Title>225 Existing0</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:And>
              <ogc:And>
                <ogc:And>
                  <ogc:PropertyIsEqualTo>
                    <ogc:Function name="max">
                      <ogc:PropertyName>voltage_kv</ogc:PropertyName>
                      <ogc:Literal>36</ogc:Literal>
                    </ogc:Function>
                    <ogc:Literal>225</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                  <ogc:PropertyIsEqualTo>
                    <ogc:PropertyName>situation</ogc:PropertyName>
                    <ogc:Literal>Existing</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                </ogc:And>
                <ogc:PropertyIsNull>
                  <ogc:PropertyName>c_design</ogc:PropertyName>
                </ogc:PropertyIsNull>
              </ogc:And>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>c_inst</ogc:PropertyName>
                <ogc:Literal>0</ogc:Literal>
              </ogc:PropertyIsEqualTo>
            </ogc:And>
          </ogc:Filter>
          <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#4643e8</se:SvgParameter>
              <se:SvgParameter name="stroke-width">1</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
              <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>225 Existing11</se:Name>
          <se:Description>
            <se:Title>225 Existing11</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:And>
              <ogc:And>
                <ogc:And>
                  <ogc:PropertyIsEqualTo>
                    <ogc:Function name="max">
                      <ogc:PropertyName>voltage_kv</ogc:PropertyName>
                      <ogc:Literal>36</ogc:Literal>
                    </ogc:Function>
                    <ogc:Literal>225</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                  <ogc:PropertyIsEqualTo>
                    <ogc:PropertyName>situation</ogc:PropertyName>
                    <ogc:Literal>Existing</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                </ogc:And>
                <ogc:PropertyIsEqualTo>
                  <ogc:PropertyName>c_design</ogc:PropertyName>
                  <ogc:Literal>1</ogc:Literal>
                </ogc:PropertyIsEqualTo>
              </ogc:And>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>c_inst</ogc:PropertyName>
                <ogc:Literal>1</ogc:Literal>
              </ogc:PropertyIsEqualTo>
            </ogc:And>
          </ogc:Filter>
          <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#0000ff</se:SvgParameter>
              <se:SvgParameter name="stroke-width">3</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
              <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>225 Existing21</se:Name>
          <se:Description>
            <se:Title>225 Existing21</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:And>
              <ogc:And>
                <ogc:And>
                  <ogc:PropertyIsEqualTo>
                    <ogc:Function name="max">
                      <ogc:PropertyName>voltage_kv</ogc:PropertyName>
                      <ogc:Literal>36</ogc:Literal>
                    </ogc:Function>
                    <ogc:Literal>225</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                  <ogc:PropertyIsEqualTo>
                    <ogc:PropertyName>situation</ogc:PropertyName>
                    <ogc:Literal>Existing</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                </ogc:And>
                <ogc:PropertyIsEqualTo>
                  <ogc:PropertyName>c_design</ogc:PropertyName>
                  <ogc:Literal>2</ogc:Literal>
                </ogc:PropertyIsEqualTo>
              </ogc:And>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>c_inst</ogc:PropertyName>
                <ogc:Literal>1</ogc:Literal>
              </ogc:PropertyIsEqualTo>
            </ogc:And>
          </ogc:Filter>
          <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#0000ff</se:SvgParameter>
              <se:SvgParameter name="stroke-width">3</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
              <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>
          <se:LineSymbolizer>
            <se:Stroke>
              <se:GraphicStroke>
                <se:Graphic>
                  <se:Mark>
                    <se:WellKnownName>circle</se:WellKnownName>
                    <se:Fill>
                      <se:SvgParameter name="fill">#0000ff</se:SvgParameter>
                    </se:Fill>
                    <se:Stroke>
                       <se:SvgParameter name="stroke">#0000ff</se:SvgParameter>
                       <se:SvgParameter name="stroke-width">0</se:SvgParameter>
                    </se:Stroke>
                  </se:Mark>
                  <se:Size>6</se:Size>
                  <se:Displacement>
                    <se:DisplacementX>0</se:DisplacementX>
                    <se:DisplacementY>12</se:DisplacementY>
                  </se:Displacement>
                </se:Graphic>
              </se:GraphicStroke>
              <se:SvgParameter name="stroke-dasharray">6 10</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>225 Existing22</se:Name>
          <se:Description>
            <se:Title>225 Existing22</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:And>
              <ogc:And>
                <ogc:And>
                  <ogc:PropertyIsEqualTo>
                    <ogc:Function name="max">
                      <ogc:PropertyName>voltage_kv</ogc:PropertyName>
                      <ogc:Literal>36</ogc:Literal>
                    </ogc:Function>
                    <ogc:Literal>225</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                  <ogc:PropertyIsEqualTo>
                    <ogc:PropertyName>situation</ogc:PropertyName>
                    <ogc:Literal>Existing</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                </ogc:And>
                <ogc:PropertyIsEqualTo>
                  <ogc:PropertyName>c_design</ogc:PropertyName>
                  <ogc:Literal>2</ogc:Literal>
                </ogc:PropertyIsEqualTo>
              </ogc:And>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>c_inst</ogc:PropertyName>
                <ogc:Literal>2</ogc:Literal>
              </ogc:PropertyIsEqualTo>
            </ogc:And>
          </ogc:Filter>
          <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#0000ff</se:SvgParameter>
              <se:SvgParameter name="stroke-width">3</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
              <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>
          <se:LineSymbolizer>
            <se:Stroke>
              <se:GraphicStroke>
                <se:Graphic>
                  <se:Mark>
                    <se:WellKnownName>square</se:WellKnownName>
                    <se:Fill>
                      <se:SvgParameter name="fill">#0000ff</se:SvgParameter>
                    </se:Fill>
                    <se:Stroke>
                       <se:SvgParameter name="stroke">#0000ff</se:SvgParameter>
                       <se:SvgParameter name="stroke-width">0</se:SvgParameter>
                    </se:Stroke>
                  </se:Mark>
                  <se:Size>4</se:Size>
                  <se:Displacement>
                    <se:DisplacementX>0</se:DisplacementX>
                    <se:DisplacementY>4</se:DisplacementY>
                  </se:Displacement>
                </se:Graphic>
              </se:GraphicStroke>
              <se:SvgParameter name="stroke-dasharray">4 8</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>225 Future0</se:Name>
          <se:Description>
            <se:Title>225 Future0</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:And>
              <ogc:And>
                <ogc:And>
                  <ogc:PropertyIsEqualTo>
                    <ogc:Function name="max">
                      <ogc:PropertyName>voltage_kv</ogc:PropertyName>
                      <ogc:Literal>36</ogc:Literal>
                    </ogc:Function>
                    <ogc:Literal>225</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                  <ogc:PropertyIsEqualTo>
                    <ogc:PropertyName>situation</ogc:PropertyName>
                    <ogc:Literal>Future</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                </ogc:And>
                <ogc:PropertyIsNull>
                  <ogc:PropertyName>c_design</ogc:PropertyName>
                </ogc:PropertyIsNull>
              </ogc:And>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>c_inst</ogc:PropertyName>
                <ogc:Literal>0</ogc:Literal>
              </ogc:PropertyIsEqualTo>
            </ogc:And>
          </ogc:Filter>
          <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#56db8b</se:SvgParameter>
              <se:SvgParameter name="stroke-width">1</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
              <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>225 Future11</se:Name>
          <se:Description>
            <se:Title>225 Future11</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:And>
              <ogc:And>
                <ogc:And>
                  <ogc:PropertyIsEqualTo>
                    <ogc:Function name="max">
                      <ogc:PropertyName>voltage_kv</ogc:PropertyName>
                      <ogc:Literal>36</ogc:Literal>
                    </ogc:Function>
                    <ogc:Literal>225</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                  <ogc:PropertyIsEqualTo>
                    <ogc:PropertyName>situation</ogc:PropertyName>
                    <ogc:Literal>Future</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                </ogc:And>
                <ogc:PropertyIsEqualTo>
                  <ogc:PropertyName>c_design</ogc:PropertyName>
                  <ogc:Literal>1</ogc:Literal>
                </ogc:PropertyIsEqualTo>
              </ogc:And>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>c_inst</ogc:PropertyName>
                <ogc:Literal>1</ogc:Literal>
              </ogc:PropertyIsEqualTo>
            </ogc:And>
          </ogc:Filter>
          <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#0000ff</se:SvgParameter>
              <se:SvgParameter name="stroke-width">3</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
              <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
              <se:SvgParameter name="stroke-dasharray">12 8</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>225 Future21</se:Name>
          <se:Description>
            <se:Title>225 Future21</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:And>
              <ogc:And>
                <ogc:And>
                  <ogc:PropertyIsEqualTo>
                    <ogc:Function name="max">
                      <ogc:PropertyName>voltage_kv</ogc:PropertyName>
                      <ogc:Literal>36</ogc:Literal>
                    </ogc:Function>
                    <ogc:Literal>225</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                  <ogc:PropertyIsEqualTo>
                    <ogc:PropertyName>situation</ogc:PropertyName>
                    <ogc:Literal>Future</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                </ogc:And>
                <ogc:PropertyIsEqualTo>
                  <ogc:PropertyName>c_design</ogc:PropertyName>
                  <ogc:Literal>2</ogc:Literal>
                </ogc:PropertyIsEqualTo>
              </ogc:And>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>c_inst</ogc:PropertyName>
                <ogc:Literal>1</ogc:Literal>
              </ogc:PropertyIsEqualTo>
            </ogc:And>
          </ogc:Filter>
          <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#0000ff</se:SvgParameter>
              <se:SvgParameter name="stroke-width">3</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
              <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
              <se:SvgParameter name="stroke-dasharray">12 8</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>
          <se:LineSymbolizer>
            <se:Stroke>
              <se:GraphicStroke>
                <se:Graphic>
                  <se:Mark>
                    <se:WellKnownName>circle</se:WellKnownName>
                    <se:Fill>
                      <se:SvgParameter name="fill">#0000ff</se:SvgParameter>
                    </se:Fill>
                    <se:Stroke>
                       <se:SvgParameter name="stroke">#0000ff</se:SvgParameter>
                       <se:SvgParameter name="stroke-width">0</se:SvgParameter>
                    </se:Stroke>
                  </se:Mark>
                  <se:Size>6</se:Size>
                  <se:Displacement>
                    <se:DisplacementX>0</se:DisplacementX>
                    <se:DisplacementY>12</se:DisplacementY>
                  </se:Displacement>
                </se:Graphic>
              </se:GraphicStroke>
              <se:SvgParameter name="stroke-dasharray">6 14</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>225 Future22</se:Name>
          <se:Description>
            <se:Title>225 Future22</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:And>
              <ogc:And>
                <ogc:And>
                  <ogc:PropertyIsEqualTo>
                    <ogc:Function name="max">
                      <ogc:PropertyName>voltage_kv</ogc:PropertyName>
                      <ogc:Literal>36</ogc:Literal>
                    </ogc:Function>
                    <ogc:Literal>225</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                  <ogc:PropertyIsEqualTo>
                    <ogc:PropertyName>situation</ogc:PropertyName>
                    <ogc:Literal>Future</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                </ogc:And>
                <ogc:PropertyIsEqualTo>
                  <ogc:PropertyName>c_design</ogc:PropertyName>
                  <ogc:Literal>2</ogc:Literal>
                </ogc:PropertyIsEqualTo>
              </ogc:And>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>c_inst</ogc:PropertyName>
                <ogc:Literal>2</ogc:Literal>
              </ogc:PropertyIsEqualTo>
            </ogc:And>
          </ogc:Filter>
          <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#0000ff</se:SvgParameter>
              <se:SvgParameter name="stroke-width">3</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
              <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
              <se:SvgParameter name="stroke-dasharray">12 8</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>
          <se:LineSymbolizer>
            <se:Stroke>
              <se:GraphicStroke>
                <se:Graphic>
                  <se:Mark>
                    <se:WellKnownName>square</se:WellKnownName>
                    <se:Fill>
                      <se:SvgParameter name="fill">#0000ff</se:SvgParameter>
                    </se:Fill>
                    <se:Stroke>
                       <se:SvgParameter name="stroke">#0000ff</se:SvgParameter>
                       <se:SvgParameter name="stroke-width">0</se:SvgParameter>
                    </se:Stroke>
                  </se:Mark>
                  <se:Size>6</se:Size>
                  <se:Displacement>
                    <se:DisplacementX>0</se:DisplacementX>
                    <se:DisplacementY>6</se:DisplacementY>
                  </se:Displacement>
                </se:Graphic>
              </se:GraphicStroke>
              <se:SvgParameter name="stroke-dasharray">8 14</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>225 Ongoing0</se:Name>
          <se:Description>
            <se:Title>225 Ongoing0</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:And>
              <ogc:And>
                <ogc:And>
                  <ogc:PropertyIsEqualTo>
                    <ogc:Function name="max">
                      <ogc:PropertyName>voltage_kv</ogc:PropertyName>
                      <ogc:Literal>36</ogc:Literal>
                    </ogc:Function>
                    <ogc:Literal>225</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                  <ogc:PropertyIsEqualTo>
                    <ogc:PropertyName>situation</ogc:PropertyName>
                    <ogc:Literal>Ongoing</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                </ogc:And>
                <ogc:PropertyIsNull>
                  <ogc:PropertyName>c_design</ogc:PropertyName>
                </ogc:PropertyIsNull>
              </ogc:And>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>c_inst</ogc:PropertyName>
                <ogc:Literal>0</ogc:Literal>
              </ogc:PropertyIsEqualTo>
            </ogc:And>
          </ogc:Filter>
          <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#7b0fc8</se:SvgParameter>
              <se:SvgParameter name="stroke-width">1</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
              <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>225 Ongoing11</se:Name>
          <se:Description>
            <se:Title>225 Ongoing11</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:And>
              <ogc:And>
                <ogc:And>
                  <ogc:PropertyIsEqualTo>
                    <ogc:Function name="max">
                      <ogc:PropertyName>voltage_kv</ogc:PropertyName>
                      <ogc:Literal>36</ogc:Literal>
                    </ogc:Function>
                    <ogc:Literal>225</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                  <ogc:PropertyIsEqualTo>
                    <ogc:PropertyName>situation</ogc:PropertyName>
                    <ogc:Literal>Ongoing</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                </ogc:And>
                <ogc:PropertyIsEqualTo>
                  <ogc:PropertyName>c_design</ogc:PropertyName>
                  <ogc:Literal>1</ogc:Literal>
                </ogc:PropertyIsEqualTo>
              </ogc:And>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>c_inst</ogc:PropertyName>
                <ogc:Literal>1</ogc:Literal>
              </ogc:PropertyIsEqualTo>
            </ogc:And>
          </ogc:Filter>
          <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#ecbe7d</se:SvgParameter>
              <se:SvgParameter name="stroke-width">1</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
              <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>225 Ongoing22</se:Name>
          <se:Description>
            <se:Title>225 Ongoing22</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:And>
              <ogc:And>
                <ogc:And>
                  <ogc:PropertyIsEqualTo>
                    <ogc:Function name="max">
                      <ogc:PropertyName>voltage_kv</ogc:PropertyName>
                      <ogc:Literal>36</ogc:Literal>
                    </ogc:Function>
                    <ogc:Literal>225</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                  <ogc:PropertyIsEqualTo>
                    <ogc:PropertyName>situation</ogc:PropertyName>
                    <ogc:Literal>Ongoing</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                </ogc:And>
                <ogc:PropertyIsEqualTo>
                  <ogc:PropertyName>c_design</ogc:PropertyName>
                  <ogc:Literal>2</ogc:Literal>
                </ogc:PropertyIsEqualTo>
              </ogc:And>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>c_inst</ogc:PropertyName>
                <ogc:Literal>2</ogc:Literal>
              </ogc:PropertyIsEqualTo>
            </ogc:And>
          </ogc:Filter>
          <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#e6d23b</se:SvgParameter>
              <se:SvgParameter name="stroke-width">1</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
              <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>330 Existing0</se:Name>
          <se:Description>
            <se:Title>330 Existing0</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:And>
              <ogc:And>
                <ogc:And>
                  <ogc:PropertyIsEqualTo>
                    <ogc:Function name="max">
                      <ogc:PropertyName>voltage_kv</ogc:PropertyName>
                      <ogc:Literal>36</ogc:Literal>
                    </ogc:Function>
                    <ogc:Literal>330</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                  <ogc:PropertyIsEqualTo>
                    <ogc:PropertyName>situation</ogc:PropertyName>
                    <ogc:Literal>Existing</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                </ogc:And>
                <ogc:PropertyIsNull>
                  <ogc:PropertyName>c_design</ogc:PropertyName>
                </ogc:PropertyIsNull>
              </ogc:And>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>c_inst</ogc:PropertyName>
                <ogc:Literal>0</ogc:Literal>
              </ogc:PropertyIsEqualTo>
            </ogc:And>
          </ogc:Filter>
          <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#dd5e27</se:SvgParameter>
              <se:SvgParameter name="stroke-width">1</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
              <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>330 Existing11</se:Name>
          <se:Description>
            <se:Title>330 Existing11</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:And>
              <ogc:And>
                <ogc:And>
                  <ogc:PropertyIsEqualTo>
                    <ogc:Function name="max">
                      <ogc:PropertyName>voltage_kv</ogc:PropertyName>
                      <ogc:Literal>36</ogc:Literal>
                    </ogc:Function>
                    <ogc:Literal>330</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                  <ogc:PropertyIsEqualTo>
                    <ogc:PropertyName>situation</ogc:PropertyName>
                    <ogc:Literal>Existing</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                </ogc:And>
                <ogc:PropertyIsEqualTo>
                  <ogc:PropertyName>c_design</ogc:PropertyName>
                  <ogc:Literal>1</ogc:Literal>
                </ogc:PropertyIsEqualTo>
              </ogc:And>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>c_inst</ogc:PropertyName>
                <ogc:Literal>1</ogc:Literal>
              </ogc:PropertyIsEqualTo>
            </ogc:And>
          </ogc:Filter>
          <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#ff0000</se:SvgParameter>
              <se:SvgParameter name="stroke-width">3</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
              <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>330 Existing22</se:Name>
          <se:Description>
            <se:Title>330 Existing22</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:And>
              <ogc:And>
                <ogc:And>
                  <ogc:PropertyIsEqualTo>
                    <ogc:Function name="max">
                      <ogc:PropertyName>voltage_kv</ogc:PropertyName>
                      <ogc:Literal>36</ogc:Literal>
                    </ogc:Function>
                    <ogc:Literal>330</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                  <ogc:PropertyIsEqualTo>
                    <ogc:PropertyName>situation</ogc:PropertyName>
                    <ogc:Literal>Existing</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                </ogc:And>
                <ogc:PropertyIsEqualTo>
                  <ogc:PropertyName>c_design</ogc:PropertyName>
                  <ogc:Literal>2</ogc:Literal>
                </ogc:PropertyIsEqualTo>
              </ogc:And>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>c_inst</ogc:PropertyName>
                <ogc:Literal>2</ogc:Literal>
              </ogc:PropertyIsEqualTo>
            </ogc:And>
          </ogc:Filter>
          <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#ff0000</se:SvgParameter>
              <se:SvgParameter name="stroke-width">3</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
              <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>
          <se:LineSymbolizer>
            <se:Stroke>
              <se:GraphicStroke>
                <se:Graphic>
                  <se:Mark>
                    <se:WellKnownName>square</se:WellKnownName>
                    <se:Fill>
                      <se:SvgParameter name="fill">#ff0000</se:SvgParameter>
                    </se:Fill>
                    <se:Stroke>
                       <se:SvgParameter name="stroke">#ff0000</se:SvgParameter>
                       <se:SvgParameter name="stroke-width">0</se:SvgParameter>
                    </se:Stroke>
                  </se:Mark>
                  <se:Size>6</se:Size>
                  <se:Displacement>
                    <se:DisplacementX>0</se:DisplacementX>
                    <se:DisplacementY>6</se:DisplacementY>
                  </se:Displacement>
                </se:Graphic>
              </se:GraphicStroke>
              <se:SvgParameter name="stroke-dasharray">6 12</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>330 Future0</se:Name>
          <se:Description>
            <se:Title>330 Future0</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:And>
              <ogc:And>
                <ogc:And>
                  <ogc:PropertyIsEqualTo>
                    <ogc:Function name="max">
                      <ogc:PropertyName>voltage_kv</ogc:PropertyName>
                      <ogc:Literal>36</ogc:Literal>
                    </ogc:Function>
                    <ogc:Literal>330</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                  <ogc:PropertyIsEqualTo>
                    <ogc:PropertyName>situation</ogc:PropertyName>
                    <ogc:Literal>Future</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                </ogc:And>
                <ogc:PropertyIsNull>
                  <ogc:PropertyName>c_design</ogc:PropertyName>
                </ogc:PropertyIsNull>
              </ogc:And>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>c_inst</ogc:PropertyName>
                <ogc:Literal>0</ogc:Literal>
              </ogc:PropertyIsEqualTo>
            </ogc:And>
          </ogc:Filter>
          <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#56ed20</se:SvgParameter>
              <se:SvgParameter name="stroke-width">1</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
              <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>330 Future11</se:Name>
          <se:Description>
            <se:Title>330 Future11</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:And>
              <ogc:And>
                <ogc:And>
                  <ogc:PropertyIsEqualTo>
                    <ogc:Function name="max">
                      <ogc:PropertyName>voltage_kv</ogc:PropertyName>
                      <ogc:Literal>36</ogc:Literal>
                    </ogc:Function>
                    <ogc:Literal>330</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                  <ogc:PropertyIsEqualTo>
                    <ogc:PropertyName>situation</ogc:PropertyName>
                    <ogc:Literal>Future</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                </ogc:And>
                <ogc:PropertyIsEqualTo>
                  <ogc:PropertyName>c_design</ogc:PropertyName>
                  <ogc:Literal>1</ogc:Literal>
                </ogc:PropertyIsEqualTo>
              </ogc:And>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>c_inst</ogc:PropertyName>
                <ogc:Literal>1</ogc:Literal>
              </ogc:PropertyIsEqualTo>
            </ogc:And>
          </ogc:Filter>
          <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#ff0000</se:SvgParameter>
              <se:SvgParameter name="stroke-width">3</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
              <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
              <se:SvgParameter name="stroke-dasharray">12 8</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>330 Future22</se:Name>
          <se:Description>
            <se:Title>330 Future22</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:And>
              <ogc:And>
                <ogc:And>
                  <ogc:PropertyIsEqualTo>
                    <ogc:Function name="max">
                      <ogc:PropertyName>voltage_kv</ogc:PropertyName>
                      <ogc:Literal>36</ogc:Literal>
                    </ogc:Function>
                    <ogc:Literal>330</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                  <ogc:PropertyIsEqualTo>
                    <ogc:PropertyName>situation</ogc:PropertyName>
                    <ogc:Literal>Future</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                </ogc:And>
                <ogc:PropertyIsEqualTo>
                  <ogc:PropertyName>c_design</ogc:PropertyName>
                  <ogc:Literal>2</ogc:Literal>
                </ogc:PropertyIsEqualTo>
              </ogc:And>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>c_inst</ogc:PropertyName>
                <ogc:Literal>2</ogc:Literal>
              </ogc:PropertyIsEqualTo>
            </ogc:And>
          </ogc:Filter>
          <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#ff0000</se:SvgParameter>
              <se:SvgParameter name="stroke-width">3</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
              <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
              <se:SvgParameter name="stroke-dasharray">12 8</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>
          <se:LineSymbolizer>
            <se:Stroke>
              <se:GraphicStroke>
                <se:Graphic>
                  <se:Mark>
                    <se:WellKnownName>square</se:WellKnownName>
                    <se:Fill>
                      <se:SvgParameter name="fill">#ff0000</se:SvgParameter>
                    </se:Fill>
                    <se:Stroke>
                       <se:SvgParameter name="stroke">#ff0000</se:SvgParameter>
                       <se:SvgParameter name="stroke-width">0</se:SvgParameter>
                    </se:Stroke>
                  </se:Mark>
                  <se:Size>6</se:Size>
                  <se:Displacement>
                    <se:DisplacementX>0</se:DisplacementX>
                    <se:DisplacementY>6</se:DisplacementY>
                  </se:Displacement>
                </se:Graphic>
              </se:GraphicStroke>
              <se:SvgParameter name="stroke-dasharray">6 12</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>330 Ongoing00</se:Name>
          <se:Description>
            <se:Title>330 Ongoing00</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:And>
              <ogc:And>
                <ogc:And>
                  <ogc:PropertyIsEqualTo>
                    <ogc:Function name="max">
                      <ogc:PropertyName>voltage_kv</ogc:PropertyName>
                      <ogc:Literal>36</ogc:Literal>
                    </ogc:Function>
                    <ogc:Literal>330</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                  <ogc:PropertyIsEqualTo>
                    <ogc:PropertyName>situation</ogc:PropertyName>
                    <ogc:Literal>Ongoing</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                </ogc:And>
                <ogc:PropertyIsEqualTo>
                  <ogc:PropertyName>c_design</ogc:PropertyName>
                  <ogc:Literal>0</ogc:Literal>
                </ogc:PropertyIsEqualTo>
              </ogc:And>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>c_inst</ogc:PropertyName>
                <ogc:Literal>0</ogc:Literal>
              </ogc:PropertyIsEqualTo>
            </ogc:And>
          </ogc:Filter>
          <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#67db7e</se:SvgParameter>
              <se:SvgParameter name="stroke-width">1</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
              <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>36 Existing0</se:Name>
          <se:Description>
            <se:Title>36 Existing0</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:And>
              <ogc:And>
                <ogc:And>
                  <ogc:PropertyIsEqualTo>
                    <ogc:Function name="max">
                      <ogc:PropertyName>voltage_kv</ogc:PropertyName>
                      <ogc:Literal>36</ogc:Literal>
                    </ogc:Function>
                    <ogc:Literal>36</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                  <ogc:PropertyIsEqualTo>
                    <ogc:PropertyName>situation</ogc:PropertyName>
                    <ogc:Literal>Existing</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                </ogc:And>
                <ogc:PropertyIsNull>
                  <ogc:PropertyName>c_design</ogc:PropertyName>
                </ogc:PropertyIsNull>
              </ogc:And>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>c_inst</ogc:PropertyName>
                <ogc:Literal>0</ogc:Literal>
              </ogc:PropertyIsEqualTo>
            </ogc:And>
          </ogc:Filter>
          <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#8adae8</se:SvgParameter>
              <se:SvgParameter name="stroke-width">1</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
              <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>36 Existing11</se:Name>
          <se:Description>
            <se:Title>36 Existing11</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:And>
              <ogc:And>
                <ogc:And>
                  <ogc:PropertyIsEqualTo>
                    <ogc:Function name="max">
                      <ogc:PropertyName>voltage_kv</ogc:PropertyName>
                      <ogc:Literal>36</ogc:Literal>
                    </ogc:Function>
                    <ogc:Literal>36</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                  <ogc:PropertyIsEqualTo>
                    <ogc:PropertyName>situation</ogc:PropertyName>
                    <ogc:Literal>Existing</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                </ogc:And>
                <ogc:PropertyIsEqualTo>
                  <ogc:PropertyName>c_design</ogc:PropertyName>
                  <ogc:Literal>1</ogc:Literal>
                </ogc:PropertyIsEqualTo>
              </ogc:And>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>c_inst</ogc:PropertyName>
                <ogc:Literal>1</ogc:Literal>
              </ogc:PropertyIsEqualTo>
            </ogc:And>
          </ogc:Filter>
          <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#000000</se:SvgParameter>
              <se:SvgParameter name="stroke-width">1</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
              <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>36 Future11</se:Name>
          <se:Description>
            <se:Title>36 Future11</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:And>
              <ogc:And>
                <ogc:And>
                  <ogc:PropertyIsEqualTo>
                    <ogc:Function name="max">
                      <ogc:PropertyName>voltage_kv</ogc:PropertyName>
                      <ogc:Literal>36</ogc:Literal>
                    </ogc:Function>
                    <ogc:Literal>36</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                  <ogc:PropertyIsEqualTo>
                    <ogc:PropertyName>situation</ogc:PropertyName>
                    <ogc:Literal>Future</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                </ogc:And>
                <ogc:PropertyIsEqualTo>
                  <ogc:PropertyName>c_design</ogc:PropertyName>
                  <ogc:Literal>1</ogc:Literal>
                </ogc:PropertyIsEqualTo>
              </ogc:And>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>c_inst</ogc:PropertyName>
                <ogc:Literal>1</ogc:Literal>
              </ogc:PropertyIsEqualTo>
            </ogc:And>
          </ogc:Filter>
          <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#000000</se:SvgParameter>
              <se:SvgParameter name="stroke-width">2</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
              <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
              <se:SvgParameter name="stroke-dasharray">8 6</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>36 Future22</se:Name>
          <se:Description>
            <se:Title>36 Future22</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:And>
              <ogc:And>
                <ogc:And>
                  <ogc:PropertyIsEqualTo>
                    <ogc:Function name="max">
                      <ogc:PropertyName>voltage_kv</ogc:PropertyName>
                      <ogc:Literal>36</ogc:Literal>
                    </ogc:Function>
                    <ogc:Literal>36</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                  <ogc:PropertyIsEqualTo>
                    <ogc:PropertyName>situation</ogc:PropertyName>
                    <ogc:Literal>Future</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                </ogc:And>
                <ogc:PropertyIsEqualTo>
                  <ogc:PropertyName>c_design</ogc:PropertyName>
                  <ogc:Literal>2</ogc:Literal>
                </ogc:PropertyIsEqualTo>
              </ogc:And>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>c_inst</ogc:PropertyName>
                <ogc:Literal>2</ogc:Literal>
              </ogc:PropertyIsEqualTo>
            </ogc:And>
          </ogc:Filter>
          <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#000000</se:SvgParameter>
              <se:SvgParameter name="stroke-width">2</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
              <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
              <se:SvgParameter name="stroke-dasharray">8 6</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>
          <se:LineSymbolizer>
            <se:Stroke>
              <se:GraphicStroke>
                <se:Graphic>
                  <se:Mark>
                    <se:WellKnownName>square</se:WellKnownName>
                    <se:Fill>
                      <se:SvgParameter name="fill">#000000</se:SvgParameter>
                    </se:Fill>
                    <se:Stroke>
                       <se:SvgParameter name="stroke">#000000</se:SvgParameter>
                       <se:SvgParameter name="stroke-width">0</se:SvgParameter>
                    </se:Stroke>
                  </se:Mark>
                  <se:Size>4</se:Size>
                  <se:Displacement>
                    <se:DisplacementX>0</se:DisplacementX>
                    <se:DisplacementY>4</se:DisplacementY>
                  </se:Displacement>
                </se:Graphic>
              </se:GraphicStroke>
              <se:SvgParameter name="stroke-dasharray">4 10</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>60 Existing11</se:Name>
          <se:Description>
            <se:Title>60 Existing11</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:And>
              <ogc:And>
                <ogc:And>
                  <ogc:PropertyIsEqualTo>
                    <ogc:Function name="max">
                      <ogc:PropertyName>voltage_kv</ogc:PropertyName>
                      <ogc:Literal>36</ogc:Literal>
                    </ogc:Function>
                    <ogc:Literal>60</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                  <ogc:PropertyIsEqualTo>
                    <ogc:PropertyName>situation</ogc:PropertyName>
                    <ogc:Literal>Existing</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                </ogc:And>
                <ogc:PropertyIsEqualTo>
                  <ogc:PropertyName>c_design</ogc:PropertyName>
                  <ogc:Literal>1</ogc:Literal>
                </ogc:PropertyIsEqualTo>
              </ogc:And>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>c_inst</ogc:PropertyName>
                <ogc:Literal>1</ogc:Literal>
              </ogc:PropertyIsEqualTo>
            </ogc:And>
          </ogc:Filter>
          <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#000000</se:SvgParameter>
              <se:SvgParameter name="stroke-width">1</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
              <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>63 Existing11</se:Name>
          <se:Description>
            <se:Title>63 Existing11</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:And>
              <ogc:And>
                <ogc:And>
                  <ogc:PropertyIsEqualTo>
                    <ogc:Function name="max">
                      <ogc:PropertyName>voltage_kv</ogc:PropertyName>
                      <ogc:Literal>36</ogc:Literal>
                    </ogc:Function>
                    <ogc:Literal>63</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                  <ogc:PropertyIsEqualTo>
                    <ogc:PropertyName>situation</ogc:PropertyName>
                    <ogc:Literal>Existing</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                </ogc:And>
                <ogc:PropertyIsEqualTo>
                  <ogc:PropertyName>c_design</ogc:PropertyName>
                  <ogc:Literal>1</ogc:Literal>
                </ogc:PropertyIsEqualTo>
              </ogc:And>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>c_inst</ogc:PropertyName>
                <ogc:Literal>1</ogc:Literal>
              </ogc:PropertyIsEqualTo>
            </ogc:And>
          </ogc:Filter>
          <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#000000</se:SvgParameter>
              <se:SvgParameter name="stroke-width">1</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
              <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>63 Future11</se:Name>
          <se:Description>
            <se:Title>63 Future11</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:And>
              <ogc:And>
                <ogc:And>
                  <ogc:PropertyIsEqualTo>
                    <ogc:Function name="max">
                      <ogc:PropertyName>voltage_kv</ogc:PropertyName>
                      <ogc:Literal>36</ogc:Literal>
                    </ogc:Function>
                    <ogc:Literal>63</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                  <ogc:PropertyIsEqualTo>
                    <ogc:PropertyName>situation</ogc:PropertyName>
                    <ogc:Literal>Future</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                </ogc:And>
                <ogc:PropertyIsEqualTo>
                  <ogc:PropertyName>c_design</ogc:PropertyName>
                  <ogc:Literal>1</ogc:Literal>
                </ogc:PropertyIsEqualTo>
              </ogc:And>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>c_inst</ogc:PropertyName>
                <ogc:Literal>1</ogc:Literal>
              </ogc:PropertyIsEqualTo>
            </ogc:And>
          </ogc:Filter>
          <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#000000</se:SvgParameter>
              <se:SvgParameter name="stroke-width">1</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
              <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
              <se:SvgParameter name="stroke-dasharray">8 6</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>66 Existing11</se:Name>
          <se:Description>
            <se:Title>66 Existing11</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:And>
              <ogc:And>
                <ogc:And>
                  <ogc:PropertyIsEqualTo>
                    <ogc:Function name="max">
                      <ogc:PropertyName>voltage_kv</ogc:PropertyName>
                      <ogc:Literal>36</ogc:Literal>
                    </ogc:Function>
                    <ogc:Literal>66</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                  <ogc:PropertyIsEqualTo>
                    <ogc:PropertyName>situation</ogc:PropertyName>
                    <ogc:Literal>Existing</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                </ogc:And>
                <ogc:PropertyIsEqualTo>
                  <ogc:PropertyName>c_design</ogc:PropertyName>
                  <ogc:Literal>1</ogc:Literal>
                </ogc:PropertyIsEqualTo>
              </ogc:And>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>c_inst</ogc:PropertyName>
                <ogc:Literal>1</ogc:Literal>
              </ogc:PropertyIsEqualTo>
            </ogc:And>
          </ogc:Filter>
          <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#000000</se:SvgParameter>
              <se:SvgParameter name="stroke-width">1</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
              <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>66 Existing22</se:Name>
          <se:Description>
            <se:Title>66 Existing22</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:And>
              <ogc:And>
                <ogc:And>
                  <ogc:PropertyIsEqualTo>
                    <ogc:Function name="max">
                      <ogc:PropertyName>voltage_kv</ogc:PropertyName>
                      <ogc:Literal>36</ogc:Literal>
                    </ogc:Function>
                    <ogc:Literal>66</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                  <ogc:PropertyIsEqualTo>
                    <ogc:PropertyName>situation</ogc:PropertyName>
                    <ogc:Literal>Existing</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                </ogc:And>
                <ogc:PropertyIsEqualTo>
                  <ogc:PropertyName>c_design</ogc:PropertyName>
                  <ogc:Literal>2</ogc:Literal>
                </ogc:PropertyIsEqualTo>
              </ogc:And>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>c_inst</ogc:PropertyName>
                <ogc:Literal>2</ogc:Literal>
              </ogc:PropertyIsEqualTo>
            </ogc:And>
          </ogc:Filter>
          <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#000000</se:SvgParameter>
              <se:SvgParameter name="stroke-width">1</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
              <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>
          <se:LineSymbolizer>
            <se:Stroke>
              <se:GraphicStroke>
                <se:Graphic>
                  <se:Mark>
                    <se:WellKnownName>square</se:WellKnownName>
                    <se:Fill>
                      <se:SvgParameter name="fill">#000000</se:SvgParameter>
                    </se:Fill>
                    <se:Stroke>
                       <se:SvgParameter name="stroke">#000000</se:SvgParameter>
                       <se:SvgParameter name="stroke-width">0</se:SvgParameter>
                    </se:Stroke>
                  </se:Mark>
                  <se:Size>4</se:Size>
                  <se:Displacement>
                    <se:DisplacementX>0</se:DisplacementX>
                    <se:DisplacementY>4</se:DisplacementY>
                  </se:Displacement>
                </se:Graphic>
              </se:GraphicStroke>
              <se:SvgParameter name="stroke-dasharray">4 8</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>66 Future11</se:Name>
          <se:Description>
            <se:Title>66 Future11</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:And>
              <ogc:And>
                <ogc:And>
                  <ogc:PropertyIsEqualTo>
                    <ogc:Function name="max">
                      <ogc:PropertyName>voltage_kv</ogc:PropertyName>
                      <ogc:Literal>36</ogc:Literal>
                    </ogc:Function>
                    <ogc:Literal>66</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                  <ogc:PropertyIsEqualTo>
                    <ogc:PropertyName>situation</ogc:PropertyName>
                    <ogc:Literal>Future</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                </ogc:And>
                <ogc:PropertyIsEqualTo>
                  <ogc:PropertyName>c_design</ogc:PropertyName>
                  <ogc:Literal>1</ogc:Literal>
                </ogc:PropertyIsEqualTo>
              </ogc:And>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>c_inst</ogc:PropertyName>
                <ogc:Literal>1</ogc:Literal>
              </ogc:PropertyIsEqualTo>
            </ogc:And>
          </ogc:Filter>
          <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#000000</se:SvgParameter>
              <se:SvgParameter name="stroke-width">1</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
              <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
              <se:SvgParameter name="stroke-dasharray">8 6</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>66 Future22</se:Name>
          <se:Description>
            <se:Title>66 Future22</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:And>
              <ogc:And>
                <ogc:And>
                  <ogc:PropertyIsEqualTo>
                    <ogc:Function name="max">
                      <ogc:PropertyName>voltage_kv</ogc:PropertyName>
                      <ogc:Literal>36</ogc:Literal>
                    </ogc:Function>
                    <ogc:Literal>66</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                  <ogc:PropertyIsEqualTo>
                    <ogc:PropertyName>situation</ogc:PropertyName>
                    <ogc:Literal>Future</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                </ogc:And>
                <ogc:PropertyIsEqualTo>
                  <ogc:PropertyName>c_design</ogc:PropertyName>
                  <ogc:Literal>2</ogc:Literal>
                </ogc:PropertyIsEqualTo>
              </ogc:And>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>c_inst</ogc:PropertyName>
                <ogc:Literal>2</ogc:Literal>
              </ogc:PropertyIsEqualTo>
            </ogc:And>
          </ogc:Filter>
          <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#000000</se:SvgParameter>
              <se:SvgParameter name="stroke-width">2</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
              <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
              <se:SvgParameter name="stroke-dasharray">8 6</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>
          <se:LineSymbolizer>
            <se:Stroke>
              <se:GraphicStroke>
                <se:Graphic>
                  <se:Mark>
                    <se:WellKnownName>square</se:WellKnownName>
                    <se:Fill>
                      <se:SvgParameter name="fill">#000000</se:SvgParameter>
                    </se:Fill>
                    <se:Stroke>
                       <se:SvgParameter name="stroke">#000000</se:SvgParameter>
                       <se:SvgParameter name="stroke-width">0</se:SvgParameter>
                    </se:Stroke>
                  </se:Mark>
                  <se:Size>4</se:Size>
                  <se:Displacement>
                    <se:DisplacementX>0</se:DisplacementX>
                    <se:DisplacementY>4</se:DisplacementY>
                  </se:Displacement>
                </se:Graphic>
              </se:GraphicStroke>
              <se:SvgParameter name="stroke-dasharray">4 12</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>69 Existing11</se:Name>
          <se:Description>
            <se:Title>69 Existing11</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:And>
              <ogc:And>
                <ogc:And>
                  <ogc:PropertyIsEqualTo>
                    <ogc:Function name="max">
                      <ogc:PropertyName>voltage_kv</ogc:PropertyName>
                      <ogc:Literal>36</ogc:Literal>
                    </ogc:Function>
                    <ogc:Literal>69</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                  <ogc:PropertyIsEqualTo>
                    <ogc:PropertyName>situation</ogc:PropertyName>
                    <ogc:Literal>Existing</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                </ogc:And>
                <ogc:PropertyIsEqualTo>
                  <ogc:PropertyName>c_design</ogc:PropertyName>
                  <ogc:Literal>1</ogc:Literal>
                </ogc:PropertyIsEqualTo>
              </ogc:And>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>c_inst</ogc:PropertyName>
                <ogc:Literal>1</ogc:Literal>
              </ogc:PropertyIsEqualTo>
            </ogc:And>
          </ogc:Filter>
          <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#000000</se:SvgParameter>
              <se:SvgParameter name="stroke-width">1</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
              <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>90 Existing0</se:Name>
          <se:Description>
            <se:Title>90 Existing0</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:And>
              <ogc:And>
                <ogc:And>
                  <ogc:PropertyIsEqualTo>
                    <ogc:Function name="max">
                      <ogc:PropertyName>voltage_kv</ogc:PropertyName>
                      <ogc:Literal>36</ogc:Literal>
                    </ogc:Function>
                    <ogc:Literal>90</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                  <ogc:PropertyIsEqualTo>
                    <ogc:PropertyName>situation</ogc:PropertyName>
                    <ogc:Literal>Existing</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                </ogc:And>
                <ogc:PropertyIsNull>
                  <ogc:PropertyName>c_design</ogc:PropertyName>
                </ogc:PropertyIsNull>
              </ogc:And>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>c_inst</ogc:PropertyName>
                <ogc:Literal>0</ogc:Literal>
              </ogc:PropertyIsEqualTo>
            </ogc:And>
          </ogc:Filter>
          <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#0ed2cb</se:SvgParameter>
              <se:SvgParameter name="stroke-width">1</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
              <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>90 Existing1</se:Name>
          <se:Description>
            <se:Title>90 Existing1</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:And>
              <ogc:And>
                <ogc:And>
                  <ogc:PropertyIsEqualTo>
                    <ogc:Function name="max">
                      <ogc:PropertyName>voltage_kv</ogc:PropertyName>
                      <ogc:Literal>36</ogc:Literal>
                    </ogc:Function>
                    <ogc:Literal>90</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                  <ogc:PropertyIsEqualTo>
                    <ogc:PropertyName>situation</ogc:PropertyName>
                    <ogc:Literal>Existing</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                </ogc:And>
                <ogc:PropertyIsNull>
                  <ogc:PropertyName>c_design</ogc:PropertyName>
                </ogc:PropertyIsNull>
              </ogc:And>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>c_inst</ogc:PropertyName>
                <ogc:Literal>1</ogc:Literal>
              </ogc:PropertyIsEqualTo>
            </ogc:And>
          </ogc:Filter>
          <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#b9d919</se:SvgParameter>
              <se:SvgParameter name="stroke-width">1</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
              <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>90 Existing10</se:Name>
          <se:Description>
            <se:Title>90 Existing10</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:And>
              <ogc:And>
                <ogc:And>
                  <ogc:PropertyIsEqualTo>
                    <ogc:Function name="max">
                      <ogc:PropertyName>voltage_kv</ogc:PropertyName>
                      <ogc:Literal>36</ogc:Literal>
                    </ogc:Function>
                    <ogc:Literal>90</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                  <ogc:PropertyIsEqualTo>
                    <ogc:PropertyName>situation</ogc:PropertyName>
                    <ogc:Literal>Existing</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                </ogc:And>
                <ogc:PropertyIsEqualTo>
                  <ogc:PropertyName>c_design</ogc:PropertyName>
                  <ogc:Literal>1</ogc:Literal>
                </ogc:PropertyIsEqualTo>
              </ogc:And>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>c_inst</ogc:PropertyName>
                <ogc:Literal>0</ogc:Literal>
              </ogc:PropertyIsEqualTo>
            </ogc:And>
          </ogc:Filter>
          <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#6b50d5</se:SvgParameter>
              <se:SvgParameter name="stroke-width">1</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
              <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>90 Existing11</se:Name>
          <se:Description>
            <se:Title>90 Existing11</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:And>
              <ogc:And>
                <ogc:And>
                  <ogc:PropertyIsEqualTo>
                    <ogc:Function name="max">
                      <ogc:PropertyName>voltage_kv</ogc:PropertyName>
                      <ogc:Literal>36</ogc:Literal>
                    </ogc:Function>
                    <ogc:Literal>90</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                  <ogc:PropertyIsEqualTo>
                    <ogc:PropertyName>situation</ogc:PropertyName>
                    <ogc:Literal>Existing</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                </ogc:And>
                <ogc:PropertyIsEqualTo>
                  <ogc:PropertyName>c_design</ogc:PropertyName>
                  <ogc:Literal>1</ogc:Literal>
                </ogc:PropertyIsEqualTo>
              </ogc:And>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>c_inst</ogc:PropertyName>
                <ogc:Literal>1</ogc:Literal>
              </ogc:PropertyIsEqualTo>
            </ogc:And>
          </ogc:Filter>
          <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#ff00ff</se:SvgParameter>
              <se:SvgParameter name="stroke-width">2</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
              <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>90 Existing110</se:Name>
          <se:Description>
            <se:Title>90 Existing110</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:And>
              <ogc:And>
                <ogc:And>
                  <ogc:PropertyIsEqualTo>
                    <ogc:Function name="max">
                      <ogc:PropertyName>voltage_kv</ogc:PropertyName>
                      <ogc:Literal>36</ogc:Literal>
                    </ogc:Function>
                    <ogc:Literal>90</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                  <ogc:PropertyIsEqualTo>
                    <ogc:PropertyName>situation</ogc:PropertyName>
                    <ogc:Literal>Existing</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                </ogc:And>
                <ogc:PropertyIsEqualTo>
                  <ogc:PropertyName>c_design</ogc:PropertyName>
                  <ogc:Literal>1</ogc:Literal>
                </ogc:PropertyIsEqualTo>
              </ogc:And>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>c_inst</ogc:PropertyName>
                <ogc:Literal>10</ogc:Literal>
              </ogc:PropertyIsEqualTo>
            </ogc:And>
          </ogc:Filter>
          <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#e651c1</se:SvgParameter>
              <se:SvgParameter name="stroke-width">1</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
              <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>90 Existing22</se:Name>
          <se:Description>
            <se:Title>90 Existing22</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:And>
              <ogc:And>
                <ogc:And>
                  <ogc:PropertyIsEqualTo>
                    <ogc:Function name="max">
                      <ogc:PropertyName>voltage_kv</ogc:PropertyName>
                      <ogc:Literal>36</ogc:Literal>
                    </ogc:Function>
                    <ogc:Literal>90</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                  <ogc:PropertyIsEqualTo>
                    <ogc:PropertyName>situation</ogc:PropertyName>
                    <ogc:Literal>Existing</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                </ogc:And>
                <ogc:PropertyIsEqualTo>
                  <ogc:PropertyName>c_design</ogc:PropertyName>
                  <ogc:Literal>2</ogc:Literal>
                </ogc:PropertyIsEqualTo>
              </ogc:And>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>c_inst</ogc:PropertyName>
                <ogc:Literal>2</ogc:Literal>
              </ogc:PropertyIsEqualTo>
            </ogc:And>
          </ogc:Filter>
          <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#ff00ff</se:SvgParameter>
              <se:SvgParameter name="stroke-width">2</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
              <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>
          <se:LineSymbolizer>
            <se:Stroke>
              <se:GraphicStroke>
                <se:Graphic>
                  <se:Mark>
                    <se:WellKnownName>square</se:WellKnownName>
                    <se:Fill>
                      <se:SvgParameter name="fill">#ff00ff</se:SvgParameter>
                    </se:Fill>
                    <se:Stroke>
                       <se:SvgParameter name="stroke">#ff00ff</se:SvgParameter>
                       <se:SvgParameter name="stroke-width">0</se:SvgParameter>
                    </se:Stroke>
                  </se:Mark>
                  <se:Size>4</se:Size>
                  <se:Displacement>
                    <se:DisplacementX>0</se:DisplacementX>
                    <se:DisplacementY>4</se:DisplacementY>
                  </se:Displacement>
                </se:Graphic>
              </se:GraphicStroke>
              <se:SvgParameter name="stroke-dasharray">4 12</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>90 Future0</se:Name>
          <se:Description>
            <se:Title>90 Future0</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:And>
              <ogc:And>
                <ogc:And>
                  <ogc:PropertyIsEqualTo>
                    <ogc:Function name="max">
                      <ogc:PropertyName>voltage_kv</ogc:PropertyName>
                      <ogc:Literal>36</ogc:Literal>
                    </ogc:Function>
                    <ogc:Literal>90</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                  <ogc:PropertyIsEqualTo>
                    <ogc:PropertyName>situation</ogc:PropertyName>
                    <ogc:Literal>Future</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                </ogc:And>
                <ogc:PropertyIsNull>
                  <ogc:PropertyName>c_design</ogc:PropertyName>
                </ogc:PropertyIsNull>
              </ogc:And>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>c_inst</ogc:PropertyName>
                <ogc:Literal>0</ogc:Literal>
              </ogc:PropertyIsEqualTo>
            </ogc:And>
          </ogc:Filter>
          <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#ef8a9c</se:SvgParameter>
              <se:SvgParameter name="stroke-width">1</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
              <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>90 Future11</se:Name>
          <se:Description>
            <se:Title>90 Future11</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:And>
              <ogc:And>
                <ogc:And>
                  <ogc:PropertyIsEqualTo>
                    <ogc:Function name="max">
                      <ogc:PropertyName>voltage_kv</ogc:PropertyName>
                      <ogc:Literal>36</ogc:Literal>
                    </ogc:Function>
                    <ogc:Literal>90</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                  <ogc:PropertyIsEqualTo>
                    <ogc:PropertyName>situation</ogc:PropertyName>
                    <ogc:Literal>Future</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                </ogc:And>
                <ogc:PropertyIsEqualTo>
                  <ogc:PropertyName>c_design</ogc:PropertyName>
                  <ogc:Literal>1</ogc:Literal>
                </ogc:PropertyIsEqualTo>
              </ogc:And>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>c_inst</ogc:PropertyName>
                <ogc:Literal>1</ogc:Literal>
              </ogc:PropertyIsEqualTo>
            </ogc:And>
          </ogc:Filter>
          <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#ff00ff</se:SvgParameter>
              <se:SvgParameter name="stroke-width">2</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
              <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
              <se:SvgParameter name="stroke-dasharray">8 6</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>90 Future22</se:Name>
          <se:Description>
            <se:Title>90 Future22</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:And>
              <ogc:And>
                <ogc:And>
                  <ogc:PropertyIsEqualTo>
                    <ogc:Function name="max">
                      <ogc:PropertyName>voltage_kv</ogc:PropertyName>
                      <ogc:Literal>36</ogc:Literal>
                    </ogc:Function>
                    <ogc:Literal>90</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                  <ogc:PropertyIsEqualTo>
                    <ogc:PropertyName>situation</ogc:PropertyName>
                    <ogc:Literal>Future</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                </ogc:And>
                <ogc:PropertyIsEqualTo>
                  <ogc:PropertyName>c_design</ogc:PropertyName>
                  <ogc:Literal>2</ogc:Literal>
                </ogc:PropertyIsEqualTo>
              </ogc:And>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>c_inst</ogc:PropertyName>
                <ogc:Literal>2</ogc:Literal>
              </ogc:PropertyIsEqualTo>
            </ogc:And>
          </ogc:Filter>
          <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#ff00ff</se:SvgParameter>
              <se:SvgParameter name="stroke-width">2</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
              <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
              <se:SvgParameter name="stroke-dasharray">8 6</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>
          <se:LineSymbolizer>
            <se:Stroke>
              <se:GraphicStroke>
                <se:Graphic>
                  <se:Mark>
                    <se:WellKnownName>square</se:WellKnownName>
                    <se:Fill>
                      <se:SvgParameter name="fill">#ff00ff</se:SvgParameter>
                    </se:Fill>
                    <se:Stroke>
                       <se:SvgParameter name="stroke">#ff00ff</se:SvgParameter>
                       <se:SvgParameter name="stroke-width">0</se:SvgParameter>
                    </se:Stroke>
                  </se:Mark>
                  <se:Size>4</se:Size>
                  <se:Displacement>
                    <se:DisplacementX>0</se:DisplacementX>
                    <se:DisplacementY>4</se:DisplacementY>
                  </se:Displacement>
                </se:Graphic>
              </se:GraphicStroke>
              <se:SvgParameter name="stroke-dasharray">4 12</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>90 Ongoing0</se:Name>
          <se:Description>
            <se:Title>90 Ongoing0</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:And>
              <ogc:And>
                <ogc:And>
                  <ogc:PropertyIsEqualTo>
                    <ogc:Function name="max">
                      <ogc:PropertyName>voltage_kv</ogc:PropertyName>
                      <ogc:Literal>36</ogc:Literal>
                    </ogc:Function>
                    <ogc:Literal>90</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                  <ogc:PropertyIsEqualTo>
                    <ogc:PropertyName>situation</ogc:PropertyName>
                    <ogc:Literal>Ongoing</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                </ogc:And>
                <ogc:PropertyIsNull>
                  <ogc:PropertyName>c_design</ogc:PropertyName>
                </ogc:PropertyIsNull>
              </ogc:And>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>c_inst</ogc:PropertyName>
                <ogc:Literal>0</ogc:Literal>
              </ogc:PropertyIsEqualTo>
            </ogc:And>
          </ogc:Filter>
          <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#2f3cc8</se:SvgParameter>
              <se:SvgParameter name="stroke-width">1</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
              <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>Other</se:Name>
          <se:ElseFilter xmlns:se="http://www.opengis.net/se"/>
          <se:LineSymbolizer>
            <se:Stroke>
              <se:SvgParameter name="stroke">#dd587e</se:SvgParameter>
              <se:SvgParameter name="stroke-width">1</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
              <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>
        </se:Rule>
      </se:FeatureTypeStyle>
    </UserStyle>
  </NamedLayer>
</StyledLayerDescriptor>