<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <svg width="1600" height="900" xmlns="http://www.w3.org/2000/svg" fill="black">


            <!-- Añade un fondo -->
            <defs>
                <linearGradient id="grad" x1="0%" y1="0%" x2="100%" y2="0%">
                    <stop offset="0%" stop-color="#A9D1FF" />
                    <stop offset="50%" stop-color="#ffffff" />
                    <stop offset="100%" stop-color="#FFBEBE" />
                </linearGradient>
            </defs>
            <rect x="0" y="0" width="100%" height="100%" fill="url(#grad)" />

            <xsl:variable name="traslacion">100</xsl:variable>

            <xsl:variable name="puntosMujeres">
                <xsl:value-of select="'100,100000 '"/> <!-- Agrega el punto (0, 10000) al principio -->
                <xsl:for-each select="Mortalidad/mortalidad">
                    <xsl:sort data-type="number" case-order="lower-first" select="año"/>
                    <xsl:variable name="posicionX" select="position()"/>
                    <xsl:variable name="muertesMujeres" select="muertesMujeres"/>
                    <xsl:variable name="puntoMujeresX" select="$posicionX*30 + $traslacion"/>
                    <xsl:variable name="puntoMujeresY" select="900-$muertesMujeres * 250"/>
                    <xsl:value-of select="concat($puntoMujeresX, ',', $puntoMujeresY, ' ')"/>
                </xsl:for-each>
                <xsl:value-of select="concat(count(Mortalidad/mortalidad)*30, ',100000')"/> <!-- Agrega el punto (20, 10000) al final -->
            </xsl:variable>

            <path d="{concat('M', $puntosMujeres)}" fill="red" stroke="black" stroke-width="2" fill-opacity="0.3"/>


            <xsl:variable name="puntosHombres">
                <xsl:value-of select="'100,100000 ' "/> <!-- Agrega el punto (0, 10000) al principio -->
                <xsl:for-each select="Mortalidad/mortalidad">
                    <xsl:sort data-type="number" case-order="lower-first" select="año"/>
                    <xsl:variable name="posicionX" select="position()"/>
                    <xsl:variable name="muertesMujeres" select="muertesMujeres"/>
                    <xsl:variable name="muertesHombres" select="muertesHombres"/>
                    <xsl:variable name="puntoHombresX" select="$posicionX*30 + $traslacion"/>
                    <xsl:variable name="puntoHombresY" select="900-$muertesHombres * 250"/>
                    <xsl:value-of select="concat($puntoHombresX, ',', $puntoHombresY, ' ')"/>
                </xsl:for-each>
                <xsl:value-of select="concat(count(Mortalidad/mortalidad)*30, ',100000')"/> <!-- Agrega el punto (20, 10000) al final -->
            </xsl:variable>

            <path d="{concat('M', $puntosHombres)}" fill="blue" stroke="black" stroke-width="2" fill-opacity="0.3"/>



            <xsl:for-each select="Mortalidad/mortalidad">
                <xsl:sort data-type="number" case-order="lower-first" select="año"/>
                <xsl:variable name="posicionX" select="position()"/>
                <xsl:variable name="muertesMujeres" select="muertesMujeres"/>
                <xsl:variable name="muertesHombres" select="muertesHombres"/>
                <xsl:variable name="puntoMujeresX" select="$posicionX*30"/>
                <xsl:variable name="puntoMujeresY" select="900-$muertesMujeres * 250"/>
                <xsl:variable name="puntoHombresX" select="$posicionX*30"/>
                <xsl:variable name="puntoHombresY" select="900-$muertesHombres * 250"/>
                <circle cx="{$puntoMujeresX + $traslacion}" cy="{$puntoMujeresY}" r="10" fill="red" />
                <circle cx="{$puntoHombresX + $traslacion}" cy="{$puntoHombresY}" r="10" fill="blue" />

                <!-- Crea las lineas separadoras -->
                <line x1="80" y1="{900 - position()*50}" x2="1600" y2="{900 - position()*50}" stroke="black" stroke-width="2" stroke-dasharray="5,5" opacity="0.2"/>
                <!-- Crea las lineas separadoras -->
                <line x1="80" y1="{900 - position()*50}" x2="120" y2="{900 - position()*50}" stroke="black" stroke-width="2" opacity="1"/>

                <!-- Crea las lineas verticales lustros -->
                <line x1="{position()*150 -20 }" y1="{900}" x2="{position() * 150 - 20}" y2="0" stroke="black" stroke-width="2"  opacity="0.5"/>

                <!-- Crea los numeros de la tasa Mortalidad -->
                <text x="{20}" y="{900-(position()-1)*50-10}" font-size="30" font-weight="bold">
                    <xsl:value-of select="position()*200-200"/>
                </text>

            </xsl:for-each>

            <!-- Crea los degradados -->
            <defs>
                <linearGradient id="red">
                    <stop offset="0%" stop-color="#ff0000"/>
                    <stop offset="100%" stop-color="#990000"/>
                </linearGradient>
                <linearGradient id="blue">
                    <stop offset="0%" stop-color="#0088ff"/>
                    <stop offset="100%" stop-color="#0055aa"/>
                </linearGradient>
            </defs>

            <!-- Crea la barra vertical -->
            <rect width="100%" height="100%" fill="url(#grid)"/>
            <line x1="100" y1="0" x2="100" y2="900" stroke="black" stroke-width="2"/>
            <!-- Crea la barra horizontal de la base -->
            <rect width="100%" height="100%" fill="url(#grid)"/>
            <line x1="0" y1="900" x2="1600" y2="900" stroke="black" stroke-width="5"/>




            <!-- Leyenda -->
            <rect x="150" y="55" width="40" height="40" fill="url(#red)"/>
            <text x="200" y="80" font-size="18">MUJERES</text>

            <rect x="150" y="105" width="40" height="40" fill="url(#blue)"/>
            <text x="200" y="130" font-size="18">HOMBRES</text>

        </svg>

        <!-- Coloca los numeros abajo -->
        <svg width="1600" height="100" xmlns="http://www.w3.org/2000/svg">
            <xsl:variable name="traslacion">70</xsl:variable>
            <text x="{5}" y="{30}" font-size="25" font-weight="bold">
                AÑOS🠮
            </text>
            <xsl:for-each select="Mortalidad/mortalidad">
                <xsl:sort select="año" case-order="lower-first"/>
                <xsl:variable name="año" select="año"/>
                <text x="{position()*30+$traslacion}" y="{30}" font-size="30" font-weight="bold">
                    <xsl:if test="$año mod 5 = 0">
                        <xsl:value-of select="$año"/>
                    </xsl:if>
                </text>


            </xsl:for-each>


        </svg>
    </xsl:template>
</xsl:stylesheet>